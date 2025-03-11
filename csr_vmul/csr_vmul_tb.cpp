#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

#include "csr_vmul.h"

bool small_test() {
  constexpr int ROWS = 3;
  constexpr int COLS = 3;
  constexpr int NON_ZERO = 4;

  CSR_Matrix matrix = {
      .row_count = ROWS,
      .col_count = COLS,
      .non_zero_count = 4,
      .row_pointers = {0, 2, 3, 4},
      .col_indices = {0, 1, 1, 2},
      .values = {1.f, 2.f, 3.f, 4.f},
  };

  Vector vector = {
      .values = {1.f, 2.f, 3.f},
      .count = COLS,
  };

  Vector out = {
      .values = {0.f},
      .count = ROWS,
  };

  csr_vmul(&matrix, &vector, &out);

  float expected[ROWS] = {5.f, 6.f, 12.f};

  bool pass = true;
  for (int i = 0; i < ROWS; i++) {
    // No epsilon needed for this I believe
    if (out.values[i] != expected[i]) {
      printf("Small Test failed at %d, expected: %f, actual %f", i, expected[i], out.values[i]);
      pass = false;
    }
  }

  return pass;
}

void reference_csr_vmul(const CSR_Matrix *matrix, const Vector *vector, Vector *out) {
  out->count = matrix->row_count;
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

constexpr int N_NON_ZERO = MAX_ELEMENTS / 10;
void init_random_dense(Dense_Matrix *dense) {
  // just make sure actually sparse
  memset(dense->values, 0, dense->row_count * dense->col_count);
  dense->row_count = MAX_ELEMENTS / 4;
  dense->col_count = MAX_ELEMENTS / 4;

  srand(time(NULL));
  for (int i = 0; i < N_NON_ZERO; i++) {
    int row = rand() % dense->row_count;
    int col = rand() % dense->col_count;

    int index = row * dense->col_count + col;

    dense->values[index] = (float)(rand() % 100 + 1);
  }
}

void init_random_vector(Vector *vector) {
  srand(time(NULL));
  for (int i = 0; i < vector->count; i++) {
    vector->values[i] = (float)(rand() % 100 + 1);
  }
}

void init_csr_with_dense(CSR_Matrix *csr, const Dense_Matrix *dense) {
  csr->row_count = dense->row_count;
  csr->col_count = dense->col_count;
  csr->non_zero_count = 0;

  // always
  csr->row_pointers[0] = 0;

  for (int r = 0; r < dense->row_count; r++) {
    for (int c = 0; c < dense->col_count; c++) {
      if (dense->values[r * dense->col_count + c] != 0.0f) {
        csr->col_indices[csr->non_zero_count] = c;
        csr->values[csr->non_zero_count] = dense->values[r * dense->col_count + c];
        csr->non_zero_count += 1;
      }
    }

    csr->row_pointers[r + 1] = csr->non_zero_count;
  }
}

bool random_test() {
  Dense_Matrix dense = {0};
  init_random_dense(&dense);

  CSR_Matrix csr = {0};
  init_csr_with_dense(&csr, &dense);

  Vector vector = {0};
  vector.count = csr.row_count;
  init_random_vector(&vector);

  Vector reference_out = {0};
  reference_csr_vmul(&csr, &vector, &reference_out);

  Vector actual_out = {0};
  csr_vmul(&csr, &vector, &actual_out);

  bool passed = true;
  for (int i = 0; i < actual_out.count; i++) {
    if (actual_out.values[i] != reference_out.values[i]) {
      printf("Random Test failed at %d, expected: %f, actual %f", i, reference_out.values[i],
             actual_out.values[i]);
      passed = false;
      break;
    }
  }

  return passed;
}

int main() {

  // bool pass = small_test();
  bool pass = random_test();

  if (pass)
    printf("Test success :)");
  else
    printf("Test fail :(");

  return 0;
}
