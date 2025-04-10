-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
-- Tool Version Limit: 2024.11
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity csr_vmul_control_r_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 7;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    matrix_row_pointers   :out  STD_LOGIC_VECTOR(63 downto 0);
    matrix_col_indices    :out  STD_LOGIC_VECTOR(63 downto 0);
    matrix_values         :out  STD_LOGIC_VECTOR(63 downto 0);
    vector_values         :out  STD_LOGIC_VECTOR(63 downto 0);
    out_values            :out  STD_LOGIC_VECTOR(63 downto 0)
);
end entity csr_vmul_control_r_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_none
--
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of matrix_row_pointers
--        bit 31~0 - matrix_row_pointers[31:0] (Read/Write)
-- 0x14 : Data signal of matrix_row_pointers
--        bit 31~0 - matrix_row_pointers[63:32] (Read/Write)
-- 0x18 : reserved
-- 0x1c : Data signal of matrix_col_indices
--        bit 31~0 - matrix_col_indices[31:0] (Read/Write)
-- 0x20 : Data signal of matrix_col_indices
--        bit 31~0 - matrix_col_indices[63:32] (Read/Write)
-- 0x24 : reserved
-- 0x28 : Data signal of matrix_values
--        bit 31~0 - matrix_values[31:0] (Read/Write)
-- 0x2c : Data signal of matrix_values
--        bit 31~0 - matrix_values[63:32] (Read/Write)
-- 0x30 : reserved
-- 0x34 : Data signal of vector_values
--        bit 31~0 - vector_values[31:0] (Read/Write)
-- 0x38 : Data signal of vector_values
--        bit 31~0 - vector_values[63:32] (Read/Write)
-- 0x3c : reserved
-- 0x40 : Data signal of out_values
--        bit 31~0 - out_values[31:0] (Read/Write)
-- 0x44 : Data signal of out_values
--        bit 31~0 - out_values[63:32] (Read/Write)
-- 0x48 : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of csr_vmul_control_r_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_MATRIX_ROW_POINTERS_DATA_0 : INTEGER := 16#10#;
    constant ADDR_MATRIX_ROW_POINTERS_DATA_1 : INTEGER := 16#14#;
    constant ADDR_MATRIX_ROW_POINTERS_CTRL   : INTEGER := 16#18#;
    constant ADDR_MATRIX_COL_INDICES_DATA_0  : INTEGER := 16#1c#;
    constant ADDR_MATRIX_COL_INDICES_DATA_1  : INTEGER := 16#20#;
    constant ADDR_MATRIX_COL_INDICES_CTRL    : INTEGER := 16#24#;
    constant ADDR_MATRIX_VALUES_DATA_0       : INTEGER := 16#28#;
    constant ADDR_MATRIX_VALUES_DATA_1       : INTEGER := 16#2c#;
    constant ADDR_MATRIX_VALUES_CTRL         : INTEGER := 16#30#;
    constant ADDR_VECTOR_VALUES_DATA_0       : INTEGER := 16#34#;
    constant ADDR_VECTOR_VALUES_DATA_1       : INTEGER := 16#38#;
    constant ADDR_VECTOR_VALUES_CTRL         : INTEGER := 16#3c#;
    constant ADDR_OUT_VALUES_DATA_0          : INTEGER := 16#40#;
    constant ADDR_OUT_VALUES_DATA_1          : INTEGER := 16#44#;
    constant ADDR_OUT_VALUES_CTRL            : INTEGER := 16#48#;
    constant ADDR_BITS         : INTEGER := 7;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_matrix_row_pointers : UNSIGNED(63 downto 0) := (others => '0');
    signal int_matrix_col_indices : UNSIGNED(63 downto 0) := (others => '0');
    signal int_matrix_values   : UNSIGNED(63 downto 0) := (others => '0');
    signal int_vector_values   : UNSIGNED(63 downto 0) := (others => '0');
    signal int_out_values      : UNSIGNED(63 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 2) & (1 downto 0 => '0'));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_MATRIX_ROW_POINTERS_DATA_0 =>
                        rdata_data <= RESIZE(int_matrix_row_pointers(31 downto 0), 32);
                    when ADDR_MATRIX_ROW_POINTERS_DATA_1 =>
                        rdata_data <= RESIZE(int_matrix_row_pointers(63 downto 32), 32);
                    when ADDR_MATRIX_COL_INDICES_DATA_0 =>
                        rdata_data <= RESIZE(int_matrix_col_indices(31 downto 0), 32);
                    when ADDR_MATRIX_COL_INDICES_DATA_1 =>
                        rdata_data <= RESIZE(int_matrix_col_indices(63 downto 32), 32);
                    when ADDR_MATRIX_VALUES_DATA_0 =>
                        rdata_data <= RESIZE(int_matrix_values(31 downto 0), 32);
                    when ADDR_MATRIX_VALUES_DATA_1 =>
                        rdata_data <= RESIZE(int_matrix_values(63 downto 32), 32);
                    when ADDR_VECTOR_VALUES_DATA_0 =>
                        rdata_data <= RESIZE(int_vector_values(31 downto 0), 32);
                    when ADDR_VECTOR_VALUES_DATA_1 =>
                        rdata_data <= RESIZE(int_vector_values(63 downto 32), 32);
                    when ADDR_OUT_VALUES_DATA_0 =>
                        rdata_data <= RESIZE(int_out_values(31 downto 0), 32);
                    when ADDR_OUT_VALUES_DATA_1 =>
                        rdata_data <= RESIZE(int_out_values(63 downto 32), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    matrix_row_pointers  <= STD_LOGIC_VECTOR(int_matrix_row_pointers);
    matrix_col_indices   <= STD_LOGIC_VECTOR(int_matrix_col_indices);
    matrix_values        <= STD_LOGIC_VECTOR(int_matrix_values);
    vector_values        <= STD_LOGIC_VECTOR(int_vector_values);
    out_values           <= STD_LOGIC_VECTOR(int_out_values);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_matrix_row_pointers(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_MATRIX_ROW_POINTERS_DATA_0) then
                    int_matrix_row_pointers(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_matrix_row_pointers(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_matrix_row_pointers(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_MATRIX_ROW_POINTERS_DATA_1) then
                    int_matrix_row_pointers(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_matrix_row_pointers(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_matrix_col_indices(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_MATRIX_COL_INDICES_DATA_0) then
                    int_matrix_col_indices(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_matrix_col_indices(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_matrix_col_indices(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_MATRIX_COL_INDICES_DATA_1) then
                    int_matrix_col_indices(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_matrix_col_indices(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_matrix_values(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_MATRIX_VALUES_DATA_0) then
                    int_matrix_values(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_matrix_values(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_matrix_values(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_MATRIX_VALUES_DATA_1) then
                    int_matrix_values(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_matrix_values(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_vector_values(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_VECTOR_VALUES_DATA_0) then
                    int_vector_values(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_vector_values(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_vector_values(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_VECTOR_VALUES_DATA_1) then
                    int_vector_values(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_vector_values(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_out_values(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OUT_VALUES_DATA_0) then
                    int_out_values(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_out_values(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_out_values(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OUT_VALUES_DATA_1) then
                    int_out_values(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_out_values(63 downto 32));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
