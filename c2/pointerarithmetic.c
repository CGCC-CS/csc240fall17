#include<stdio.h>

int main() {
  int x = 7;
  int y = 3333;
  int z;
  int *p = &x;

  z=10;
  printf("x: %10d, %p, %d\n", x, (void *) &x, sizeof(x));
  printf("y: %10d, %p, %d\n", y, (void *) &y, sizeof(y));
  printf("z: %10d, %p, %d\n", z, (void *) &z, sizeof(z));
  printf("p: %10p, %p, %d, *p=%d\n", (void *) p, (void *) &p, sizeof(p), *p);


  *p=12;
  printf("\nAfter *p=12:\n");
  printf("x: %10d, %p, %d\n", x, (void *) &x, sizeof(x));
  printf("y: %10d, %p, %d\n", y, (void *) &y, sizeof(y));
  printf("z: %10d, %p, %d\n", z, (void *) &z, sizeof(z));
  printf("p: %10p, %p, %d, *p=%d\n", (void *) p, (void *) &p, sizeof(p), *p);

  p++;
  printf("\nAfter p++:\n");
  printf("x: %10d, %p, %d\n", x, (void *) &x, sizeof(x));
  printf("y: %10d, %p, %d\n", y, (void *) &y, sizeof(y));
  printf("z: %10d, %p, %d\n", z, (void *) &z, sizeof(z));
  printf("p: %10p, %p, %d, *p=%d\n", (void *) p, (void *) &p, sizeof(p), *p);

  *p=24;
  printf("\nAfter *p=24:\n");
  printf("x: %10d, %p, %d\n", x, (void *) &x, sizeof(x));
  printf("y: %10d, %p, %d\n", y, (void *) &y, sizeof(y));
  printf("z: %10d, %p, %d\n", z, (void *) &z, sizeof(z));
  printf("p: %10p, %p, %d, *p=%d\n", (void *) p, (void *) &p, sizeof(p), *p);

  (*p)++;
  printf("\nAfter (*p)++:\n");
  printf("x: %10d, %p, %d\n", x, (void *) &x, sizeof(x));
  printf("y: %10d, %p, %d\n", y, (void *) &y, sizeof(y));
  printf("z: %10d, %p, %d\n", z, (void *) &z, sizeof(z));
  printf("p: %10p, %p, %d, *p=%d\n", (void *) p, (void *) &p, sizeof(p), *p);


  (*(++p))++;
  printf("\nAfter (*(++p))++:\n");
  printf("x: %10d, %p, %d\n", x, (void *) &x, sizeof(x));
  printf("y: %10d, %p, %d\n", y, (void *) &y, sizeof(y));
  printf("z: %10d, %p, %d\n", z, (void *) &z, sizeof(z));
  printf("p: %10p, %p, %d, *p=%d\n", (void *) p, (void *) &p, sizeof(p), *p);

  return 0;
}
