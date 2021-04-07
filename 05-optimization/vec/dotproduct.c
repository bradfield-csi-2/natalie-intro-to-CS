#include "vec.h"

/*data_t dotproduct(vec_ptr u, vec_ptr v) {
    data_t sum = 0, u_val, v_val;
    for (long i = 0; i < vec_length(u); i++) { // we can assume both vectors are same length
        get_vec_element(u, i, &u_val);
        get_vec_element(v, i, &v_val);
        sum += u_val * v_val;
    }
    return sum;
}*/

// 0. Initial code - 1.88s to run 100 tests (18814240.00ns per test)
// 1. Eliminate loop inefficiencies - move length calculation out of the loop - 1.76s to run 100 tests (17636750.00ns per test)
// 2. Remove get_vec_element procedure calls - 1.14s to run 100 tests (11363820.00ns per test)
// 3. Loop unrolling using 3 accumulators - 1.07s to run 100 tests (10736580.00ns per test)

data_t dotproduct(vec_ptr u, vec_ptr v) {
    data_t sum1 = 0, sum2 = 0, sum3 = 0;
    long len = vec_length(u);
    long i = 0;

    data_t *u_data = u->data;
    data_t *v_data = v->data;

    for (; i < len - 2; i+= 3) { // we can assume both vectors are same length
        sum1 += u_data[i] * v_data[i];
        sum2 += u_data[i + 1] * v_data[i + 1];
        sum3 += u_data[i + 2] * v_data[i + 2];
    }

    for (; i < len; i++) {
        sum1 += u_data[i] * v_data[i];
    }
    return sum1 + sum2 + sum3;
}
