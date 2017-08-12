#include<stdio.h>

int main() {
  int a[4] = {1, 2, 3, 4};
  double b[3] = {2.4, 3.14, 9.9999};
  char c[6] = {'H', 'e', 'l', 'l', 'o', 'x'};
  char d[] = "world!";
  int e[] = {10, 20, 30, 40, 50, 60, 70};
  int ii;

  for (ii=0;ii<4;ii++) {
    printf("a[%d]=%d  (%x)\n", ii, a[ii], a[ii]);
  }
  printf("\n");

  for (ii=0;ii<(sizeof(b)/sizeof(double));ii++) {
    printf("b[%d]=%f\n", ii, b[ii]);
  }
  printf("\n");

  for (ii=0;ii<6;ii++) {
    printf("c[%d]=%c (%d)  d[%d]=%c (%d)\n",
                ii, c[ii], c[ii], ii, d[ii], d[ii]);
  }

  printf("\nPrinting character array as a string:\n");  
  printf("c: %s\n", c);
  printf("d: %s\n", d);

  d[6] = 88;
  d[7] = 88;
  d[8] = 88;
  printf("d (wrong): %s\n", d);
  return 0;
}
