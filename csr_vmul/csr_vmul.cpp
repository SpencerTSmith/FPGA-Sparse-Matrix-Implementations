#include "csr_vmul.h"

void csr_vmul(const CSR_Matrix *matrix, const Vector *vector, Vector *out) {
  /*

    NOTES for my own understanding: INTERFACE is a bit like declaring the registers, wires and what
    not in verilog

    the first argument is the mode of the data, how is it given to the kernel
    For the data we wish to manipulate we use m_axi because it is a high bandwith option being that
    is memory mapped
    For the little registers we use s_axilite, this interface is designed for them

  */

// Interfaces for the matrix struct members
#pragma HLS DISAGGREGATE variable = matrix
#pragma HLS INTERFACE s_axilite port = matrix->row_count bundle = control
#pragma HLS INTERFACE s_axilite port = matrix->col_count bundle = control
#pragma HLS INTERFACE s_axilite port = matrix->non_zero_count bundle = control
#pragma HLS INTERFACE m_axi port = matrix->row_pointers offset = slave bundle = gmem
#pragma HLS INTERFACE m_axi port = matrix->col_indices offset = slave bundle = gmem
#pragma HLS INTERFACE m_axi port = matrix->values offset = slave bundle = gmem

// Interfaces for the vector struct members
#pragma HLS DISAGGREGATE variable = vector
#pragma HLS INTERFACE m_axi port = vector->values offset = slave bundle = gmem
#pragma HLS INTERFACE s_axilite port = vector->count bundle = control

#pragma HLS DISAGGREGATE variable = out
#pragma HLS INTERFACE m_axi port = out->values offset = slave bundle = gmem
#pragma HLS INTERFACE s_axilite port = out->count bundle = control

// I see this done a lot in examples, not sure why... something to do with c/c++ abi always having
// return
#pragma HLS INTERFACE s_axilite port = return bundle = control

  // For every row, same as normal naive matrix multiply
  for (int row = 0; row < matrix->row_count; row++) {
    float sum = 0;

    // Go through every element we know is in this row
    for (int i = matrix->row_pointers[row]; i < matrix->row_pointers[row + 1]; i++) {
      // And multiply it by the correct colum indice in the vector
      sum += matrix->values[i] * vector->values[matrix->col_indices[i]];
    }

    out->values[row] = sum;
  }
}
