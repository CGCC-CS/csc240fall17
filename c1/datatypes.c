#include<stdio.h>

int main() {
  int x = 59;
  int y = 0x0A;   /* Hexidecimal format */
  int z;
  char c = 'A';
  char k = 66;
  float f = 10.0 / 3.0;

  /* Examples of printf control structures */
  printf("x = %d (%x hex)\n", x, x);
  printf("y = %x (%d dec)\n", y, y);
  printf("c = %c (%x hex) (%d dec)\n", c, c, c);
  printf("k = %c (%d int) (%x hex)\n", k, k, k);
  printf("f = %f (%.2f formatted)\n", f, f);

  z = x + y;
  printf("z = %d (%x hex)\n", z, z);

  /* char vs int */
  printf("Hex: 100 - A = %d\n", 100-0xA);
  printf("Char: 100 - A = %d\n", 100-'A');
  for(z=0;z<26;z++) {
     printf("%c ", 'A' + z);
  }
  printf("\n");
  return 0;
}
