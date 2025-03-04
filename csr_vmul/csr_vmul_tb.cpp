#include <cstdio>
#include <cstdlib>

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
    if (out.values[i] != expected[i]) {
      printf("Test failed at %d, expected: %f, actual %f", i, expected[i], out.values[i]);
      pass = false;
    }
  }

  return pass;
}

int main() {

  bool pass = small_test();
  if (pass)
    printf("Test success :)");
  else
    printf("Test fail :(");

  return 0;
}
