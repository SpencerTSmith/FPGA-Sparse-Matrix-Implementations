// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
module csr_vmul_control_r_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 7,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [63:0]                   matrix_row_pointers,
    output wire [63:0]                   matrix_col_indices,
    output wire [63:0]                   matrix_values,
    output wire [63:0]                   vector_values,
    output wire [63:0]                   out_values
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_none
//
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of matrix_row_pointers
//        bit 31~0 - matrix_row_pointers[31:0] (Read/Write)
// 0x14 : Data signal of matrix_row_pointers
//        bit 31~0 - matrix_row_pointers[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of matrix_col_indices
//        bit 31~0 - matrix_col_indices[31:0] (Read/Write)
// 0x20 : Data signal of matrix_col_indices
//        bit 31~0 - matrix_col_indices[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of matrix_values
//        bit 31~0 - matrix_values[31:0] (Read/Write)
// 0x2c : Data signal of matrix_values
//        bit 31~0 - matrix_values[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of vector_values
//        bit 31~0 - vector_values[31:0] (Read/Write)
// 0x38 : Data signal of vector_values
//        bit 31~0 - vector_values[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of out_values
//        bit 31~0 - out_values[31:0] (Read/Write)
// 0x44 : Data signal of out_values
//        bit 31~0 - out_values[63:32] (Read/Write)
// 0x48 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_MATRIX_ROW_POINTERS_DATA_0 = 7'h10,
    ADDR_MATRIX_ROW_POINTERS_DATA_1 = 7'h14,
    ADDR_MATRIX_ROW_POINTERS_CTRL   = 7'h18,
    ADDR_MATRIX_COL_INDICES_DATA_0  = 7'h1c,
    ADDR_MATRIX_COL_INDICES_DATA_1  = 7'h20,
    ADDR_MATRIX_COL_INDICES_CTRL    = 7'h24,
    ADDR_MATRIX_VALUES_DATA_0       = 7'h28,
    ADDR_MATRIX_VALUES_DATA_1       = 7'h2c,
    ADDR_MATRIX_VALUES_CTRL         = 7'h30,
    ADDR_VECTOR_VALUES_DATA_0       = 7'h34,
    ADDR_VECTOR_VALUES_DATA_1       = 7'h38,
    ADDR_VECTOR_VALUES_CTRL         = 7'h3c,
    ADDR_OUT_VALUES_DATA_0          = 7'h40,
    ADDR_OUT_VALUES_DATA_1          = 7'h44,
    ADDR_OUT_VALUES_CTRL            = 7'h48,
    WRIDLE                          = 2'd0,
    WRDATA                          = 2'd1,
    WRRESP                          = 2'd2,
    WRRESET                         = 2'd3,
    RDIDLE                          = 2'd0,
    RDDATA                          = 2'd1,
    RDRESET                         = 2'd2,
    ADDR_BITS                = 7;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [63:0]                   int_matrix_row_pointers = 'b0;
    reg  [63:0]                   int_matrix_col_indices = 'b0;
    reg  [63:0]                   int_matrix_values = 'b0;
    reg  [63:0]                   int_vector_values = 'b0;
    reg  [63:0]                   int_out_values = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_MATRIX_ROW_POINTERS_DATA_0: begin
                    rdata <= int_matrix_row_pointers[31:0];
                end
                ADDR_MATRIX_ROW_POINTERS_DATA_1: begin
                    rdata <= int_matrix_row_pointers[63:32];
                end
                ADDR_MATRIX_COL_INDICES_DATA_0: begin
                    rdata <= int_matrix_col_indices[31:0];
                end
                ADDR_MATRIX_COL_INDICES_DATA_1: begin
                    rdata <= int_matrix_col_indices[63:32];
                end
                ADDR_MATRIX_VALUES_DATA_0: begin
                    rdata <= int_matrix_values[31:0];
                end
                ADDR_MATRIX_VALUES_DATA_1: begin
                    rdata <= int_matrix_values[63:32];
                end
                ADDR_VECTOR_VALUES_DATA_0: begin
                    rdata <= int_vector_values[31:0];
                end
                ADDR_VECTOR_VALUES_DATA_1: begin
                    rdata <= int_vector_values[63:32];
                end
                ADDR_OUT_VALUES_DATA_0: begin
                    rdata <= int_out_values[31:0];
                end
                ADDR_OUT_VALUES_DATA_1: begin
                    rdata <= int_out_values[63:32];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign matrix_row_pointers = int_matrix_row_pointers;
assign matrix_col_indices  = int_matrix_col_indices;
assign matrix_values       = int_matrix_values;
assign vector_values       = int_vector_values;
assign out_values          = int_out_values;
// int_matrix_row_pointers[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrix_row_pointers[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIX_ROW_POINTERS_DATA_0)
            int_matrix_row_pointers[31:0] <= (WDATA[31:0] & wmask) | (int_matrix_row_pointers[31:0] & ~wmask);
    end
end

// int_matrix_row_pointers[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrix_row_pointers[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIX_ROW_POINTERS_DATA_1)
            int_matrix_row_pointers[63:32] <= (WDATA[31:0] & wmask) | (int_matrix_row_pointers[63:32] & ~wmask);
    end
end

// int_matrix_col_indices[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrix_col_indices[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIX_COL_INDICES_DATA_0)
            int_matrix_col_indices[31:0] <= (WDATA[31:0] & wmask) | (int_matrix_col_indices[31:0] & ~wmask);
    end
end

// int_matrix_col_indices[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrix_col_indices[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIX_COL_INDICES_DATA_1)
            int_matrix_col_indices[63:32] <= (WDATA[31:0] & wmask) | (int_matrix_col_indices[63:32] & ~wmask);
    end
end

// int_matrix_values[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrix_values[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIX_VALUES_DATA_0)
            int_matrix_values[31:0] <= (WDATA[31:0] & wmask) | (int_matrix_values[31:0] & ~wmask);
    end
end

// int_matrix_values[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrix_values[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIX_VALUES_DATA_1)
            int_matrix_values[63:32] <= (WDATA[31:0] & wmask) | (int_matrix_values[63:32] & ~wmask);
    end
end

// int_vector_values[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_vector_values[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VECTOR_VALUES_DATA_0)
            int_vector_values[31:0] <= (WDATA[31:0] & wmask) | (int_vector_values[31:0] & ~wmask);
    end
end

// int_vector_values[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_vector_values[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VECTOR_VALUES_DATA_1)
            int_vector_values[63:32] <= (WDATA[31:0] & wmask) | (int_vector_values[63:32] & ~wmask);
    end
end

// int_out_values[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_values[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_VALUES_DATA_0)
            int_out_values[31:0] <= (WDATA[31:0] & wmask) | (int_out_values[31:0] & ~wmask);
    end
end

// int_out_values[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_values[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_VALUES_DATA_1)
            int_out_values[63:32] <= (WDATA[31:0] & wmask) | (int_out_values[63:32] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
