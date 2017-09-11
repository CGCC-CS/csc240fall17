#include<stdio.h>

int main() {
  int x = 59;
  int y = 0x0A;   /* Hexidecimal literal */
  int z;
  unsigned int a = -40;  /* What happens here? */
  char c = 'A';   /* Character literal */
  char k = 66;
  char s[] = "Hello!";   /* String literal */
  float f = 10.0 / 3.0;  /* Float literals */
 

  /* Examples of printf control sequences */
  printf("x = %d (%x hex)\n", x, x);
  printf("y = %x (%d dec)\n", y, y);
  printf("z = %d (%x hex)\n", z, z);
  printf("a = %u (%d int) (%x hex)\n", a, a, a);
  printf("c = %c (%x hex) (%d hex)\n", c, c, c);
  printf("k = %c (%d int) (%x hex)\n", k, k, k);
  printf("f = %f (%.2f formatted)\n", f, f);
  printf("s= %s\n", s);

  z = x + y;
  printf("z = %d (%x hex)\n", z, z);

  /* int vs char */
  printf("Hex: 100 - A = %d\n", 100-0xA);
  printf("Char: 100 - A = %d\n", 100-'A');
  for(z=0;z<26;z++) {
     printf("%c ", 'A' + z);
  }
  printf("\n");

  return 0;
}
