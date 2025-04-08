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

  #pragma HLS INTERFACE m_axi port = matrix->row_pointers offset = slave bundle = BUNDLE_A \
                        depth = MAX_ELEMENTS  max_widen_bitwidth = WIDEN_BITWIDTH
  #pragma HLS INTERFACE m_axi port = matrix->col_indices  offset = slave bundle = BUNDLE_B \
                        depth = MAX_ELEMENTS  max_widen_bitwidth = WIDEN_BITWIDTH
  #pragma HLS INTERFACE m_axi port = matrix->values       offset = slave bundle = BUNDLE_C \
                        depth = MAX_ELEMENTS  max_widen_bitwidth = WIDEN_BITWIDTH

  // Interfaces for the vector struct members
  #pragma HLS DISAGGREGATE variable = vector
  #pragma HLS INTERFACE m_axi port = vector->values offset = slave bundle = BUNDLE_D \
                        depth = MAX_ELEMENTS  max_widen_bitwidth = WIDEN_BITWIDTH

  #pragma HLS INTERFACE s_axilite port = vector->count bundle = control

  #pragma HLS DISAGGREGATE variable = out
  #pragma HLS INTERFACE m_axi port = out->values offset = slave bundle = gmem
  #pragma HLS INTERFACE s_axilite port = out->count bundle = control

  // I see this done a lot in examples, not sure why... maybe something to do with c/c++ abi always
  // having return?
  #pragma HLS INTERFACE s_axilite port = return bundle = control

  out->count = matrix->row_count;

  float local_vector[MAX_ELEMENTS];
  load_vector:
  for (int i = 0; i < vector->count; i++) {
    #pragma HLS LOOP_TRIPCOUNT max = MAX_ELEMENTS
    #pragma HLS PIPELINE
    local_vector[i] = vector->values[i];
  }

  int local_col_indices[MAX_ELEMENTS];
  load_col_indices:
  for (int i = 0; i < matrix->non_zero_count; i++) {
    #pragma HLS LOOP_TRIPCOUNT max = MAX_ELEMENTS
    #pragma HLS PIPELINE
    local_col_indices[i] = matrix->col_indices[i];
  }

  int local_row_pointers[MAX_ELEMENTS];
  load_row_pointers:
  for (int i = 0; i < matrix->row_count + 1; i++) {
    #pragma HLS LOOP_TRIPCOUNT max = MAX_ELEMENTS
    #pragma HLS PIPELINE
    local_row_pointers[i] = matrix->row_pointers[i];
  }

  float local_matrix_values[MAX_ELEMENTS];
  load_matrix_values:
  for (int i = 0; i < matrix->non_zero_count; i++) {
    #pragma HLS LOOP_TRIPCOUNT max = MAX_ELEMENTS
    #pragma HLS PIPELINE
    local_matrix_values[i] = matrix->values[i];
  }

  every_row:
  for (int row = 0; row < matrix->row_count; row++) {
    #pragma HLS LOOP_TRIPCOUNT max = MAX_ELEMENTS
    #pragma HLS PIPELINE

    float partial_sums[MAX_UNROLL] = {0};
    #pragma HLS ARRAY_PARTITION variable=partial_sums complete

    unroll_partial:
    for (int i = local_row_pointers[row]; i < local_row_pointers[row + 1]; i += MAX_UNROLL) {
      #pragma HLS LOOP_TRIPCOUNT max = MAX_ELEMENTS

      partials:
      for (int j = 0; j < MAX_UNROLL && (i + j) < local_row_pointers[row + 1]; j++) {
        #pragma HLS LOOP_TRIPCOUNT max = MAX_ELEMENTS
        #pragma HLS UNROLL factor = MAX_UNROLL

        partial_sums[j] = local_matrix_values[i + j] * local_vector[local_col_indices[i + j]];
      }
    }

    float true_sum = 0;

    add_all:
    for (int i = 0; i < MAX_UNROLL; i++) {
      #pragma HLS UNROLL
      true_sum += partial_sums[i];
    }

    out->values[row] = true_sum;
  }
}
