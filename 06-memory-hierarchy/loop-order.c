  /*

Two different ways to loop over an array of arrays.

Spotted at:
http://stackoverflow.com/questions/9936132/why-does-the-order-of-the-loops-affect-performance-when-iterating-over-a-2d-arra

*/
// While both loops execute the same number of instructions, the first loop is ~15 times faster because the second loop
// jumps around in memory which results in poor spacial locality.

// D1 (First level data cache) miss rate - 0.9%
// LL miss rate - 0.3%

//void option_one() {
//  int i, j;
//  static int x[4000][4000];
//  for (i = 0; i < 4000; i++) {
//    for (j = 0; j < 4000; j++) {
//      x[i][j] = i + j;
//    }
//  }
//}


// D1 (First level data cache) miss rate - 14.3%
// LL miss rate - 0.9%
void option_two() {
  int i, j;
  static int x[4000][4000];
  for (i = 0; i < 4000; i++) {
    for (j = 0; j < 4000; j++) {
      x[j][i] = i + j;
    }
  }
}

int main() {
//  option_one();
  option_two();
  return 0;
}
