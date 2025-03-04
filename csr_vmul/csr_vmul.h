#pragma once

constexpr int MAX_ELEMENTS = 128;

struct CSR_Matrix {
  int row_count;
  int col_count;
  int non_zero_count;

  // Must be static arrays if in structs it seems, probably just decompose these and don't use
  // structs?
  int row_pointers[MAX_ELEMENTS];
  int col_indices[MAX_ELEMENTS];
  float values[MAX_ELEMENTS];
};

struct Vector {
  float values[MAX_ELEMENTS];
  int count;
};

// TODO(ss): look into using the "ap..." types or even the fixed point stuff?

void csr_vmul(const CSR_Matrix *matrix, const Vector *vector, Vector *out);
