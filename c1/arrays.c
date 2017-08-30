#include<stdio.h>

int main() {
  int a[4] = {1, 2, 3, 4};
  double b[3] = {2.4, 3.14, 9.9999};
  char c[5] = {'H', 'e', 'l', 'l', 'o'};
  char d[] = "world";
  char e[] = {10, 20, 30, 40, 50, 60};
  /*
  char f[3] = {10, 20, 30, 40, 50, 60};
  */
  int ii;

  /* What happens when we go past the end of the array? */
  for (ii=0;ii<6;ii++) {
    printf("a[%d]=%d  (%x)\n", ii, a[ii], a[ii]);
  }
  printf("\n");

  printf("Size of a=%d\n", sizeof(a));
  printf("Count of a=%d\n", sizeof(a)/sizeof(int));
  printf("\n\n");

  for (ii=0;ii<(sizeof(b)/sizeof(double));ii++) {
    printf("b[%d]=%f\n", ii, b[ii]);
  }
  printf("\n\n");

  for (ii=0;ii<6;ii++) {
    printf("c[%d]=%c (%d)  d[%d]=%c (%d)\n",
                ii, c[ii], c[ii], ii, d[ii], d[ii]);
  }  

  printf("\nPrinting character array as a string:\n");  
  printf("c {%d}: %s\n", sizeof(c), c);
  printf("d {%d}: %s\n", sizeof(d), d);

  d[5] = 88;
  d[6] = 88;
  d[7] = 88;
  printf("d (wrong): %s\n", d);

  printf("More trouble\n");
  c[6] = 88;
  printf("c {%d}: %s\n", sizeof(c), c);
  printf("d {%d}: %s\n", sizeof(d), d);

  return 0;
}
