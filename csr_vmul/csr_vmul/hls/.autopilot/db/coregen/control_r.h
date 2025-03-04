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

#define CONTROL_R_ADDR_MATRIX_ROW_POINTERS_DATA 0x10
#define CONTROL_R_BITS_MATRIX_ROW_POINTERS_DATA 64
#define CONTROL_R_ADDR_MATRIX_COL_INDICES_DATA  0x1c
#define CONTROL_R_BITS_MATRIX_COL_INDICES_DATA  64
#define CONTROL_R_ADDR_MATRIX_VALUES_DATA       0x28
#define CONTROL_R_BITS_MATRIX_VALUES_DATA       64
#define CONTROL_R_ADDR_VECTOR_VALUES_DATA       0x34
#define CONTROL_R_BITS_VECTOR_VALUES_DATA       64
#define CONTROL_R_ADDR_OUT_VALUES_DATA          0x40
#define CONTROL_R_BITS_OUT_VALUES_DATA          64
