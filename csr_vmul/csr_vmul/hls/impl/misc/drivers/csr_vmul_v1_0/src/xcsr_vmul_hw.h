// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of matrix_row_count
//        bit 31~0 - matrix_row_count[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of matrix_col_count
//        bit 31~0 - matrix_col_count[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of matrix_non_zero_count
//        bit 31~0 - matrix_non_zero_count[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of vector_count
//        bit 31~0 - vector_count[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of out_count
//        bit 31~0 - out_count[31:0] (Read/Write)
// 0x34 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCSR_VMUL_CONTROL_ADDR_AP_CTRL                    0x00
#define XCSR_VMUL_CONTROL_ADDR_GIE                        0x04
#define XCSR_VMUL_CONTROL_ADDR_IER                        0x08
#define XCSR_VMUL_CONTROL_ADDR_ISR                        0x0c
#define XCSR_VMUL_CONTROL_ADDR_MATRIX_ROW_COUNT_DATA      0x10
#define XCSR_VMUL_CONTROL_BITS_MATRIX_ROW_COUNT_DATA      32
#define XCSR_VMUL_CONTROL_ADDR_MATRIX_COL_COUNT_DATA      0x18
#define XCSR_VMUL_CONTROL_BITS_MATRIX_COL_COUNT_DATA      32
#define XCSR_VMUL_CONTROL_ADDR_MATRIX_NON_ZERO_COUNT_DATA 0x20
#define XCSR_VMUL_CONTROL_BITS_MATRIX_NON_ZERO_COUNT_DATA 32
#define XCSR_VMUL_CONTROL_ADDR_VECTOR_COUNT_DATA          0x28
#define XCSR_VMUL_CONTROL_BITS_VECTOR_COUNT_DATA          32
#define XCSR_VMUL_CONTROL_ADDR_OUT_COUNT_DATA             0x30
#define XCSR_VMUL_CONTROL_BITS_OUT_COUNT_DATA             32

// control_r
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

#define XCSR_VMUL_CONTROL_R_ADDR_MATRIX_ROW_POINTERS_DATA 0x10
#define XCSR_VMUL_CONTROL_R_BITS_MATRIX_ROW_POINTERS_DATA 64
#define XCSR_VMUL_CONTROL_R_ADDR_MATRIX_COL_INDICES_DATA  0x1c
#define XCSR_VMUL_CONTROL_R_BITS_MATRIX_COL_INDICES_DATA  64
#define XCSR_VMUL_CONTROL_R_ADDR_MATRIX_VALUES_DATA       0x28
#define XCSR_VMUL_CONTROL_R_BITS_MATRIX_VALUES_DATA       64
#define XCSR_VMUL_CONTROL_R_ADDR_VECTOR_VALUES_DATA       0x34
#define XCSR_VMUL_CONTROL_R_BITS_VECTOR_VALUES_DATA       64
#define XCSR_VMUL_CONTROL_R_ADDR_OUT_VALUES_DATA          0x40
#define XCSR_VMUL_CONTROL_R_BITS_OUT_VALUES_DATA          64

