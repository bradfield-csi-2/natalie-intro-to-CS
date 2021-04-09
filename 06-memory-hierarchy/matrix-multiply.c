/*
Naive code for multiplying two matrices together.

There must be a better way!
*/

#include <stdio.h>
#include <stdlib.h>

/*
  A naive implementation of matrix multiplication.

  DO NOT MODIFY THIS FUNCTION, the tests assume it works correctly, which it
  currently does
*/
void matrix_multiply(double **C, double **A, double **B, int a_rows, int a_cols,
                     int b_cols) {
  for (int i = 0; i < a_rows; i++) {
    for (int j = 0; j < b_cols; j++) {
      C[i][j] = 0;
      for (int k = 0; k < a_cols; k++)
        C[i][j] += A[i][k] * B[k][j];
    }
  }
}

// Using accumulator - 1.50x speedup
void fast_matrix_multiply_acc(double **c, double **a, double **b, int a_rows,
                              int a_cols, int b_cols) {
    for (int i = 0; i < a_rows; i++) {
        for (int j = 0; j < b_cols; j++) {
            double acc = 0;
            c[i][j] = 0;
            for (int k = 0; k < a_cols; k++)
                acc += a[i][k] * b[k][j];
            c[i][j] = acc;
        }
    }
}

// Try to reduce number of memory reads - 3.16x speedup
void fast_matrix_multiply(double **c, double **a, double **b, int a_rows,
                              int a_cols, int b_cols) {
        for (int i = 0; i < a_rows; i++) {
            for (int j = 0; j < b_cols; j++) {
                // this element will be used for calculating k elements of matrix c, let's store it instead of fetching it k times
                double fixed = a[i][j];
                int k = 0;
                for (;k < a_cols - 4; k += 5) {
                    c[i][k] += fixed * b[j][k];
                    c[i][k+1] += fixed * b[j][k+1];
                    c[i][k+2] += fixed * b[j][k+2];
                    c[i][k+3] += fixed * b[j][k+3];
                    c[i][k+4] += fixed * b[j][k+4];
                }

                for (;k < a_cols; k++) {
                    //printf("c[%d][%d] += %f * b[%d][%d]\n", i, k, fixed, j, k);
                    c[i][k] += fixed * b[j][k];
                    //printf("res: %f\n", c[i][k]);
                }
            }
        }
}