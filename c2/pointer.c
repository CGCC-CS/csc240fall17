#include<stdio.h>

int main() {

  int num = 6;        /* integer */
  int* ptr;           /* pointer to integer */

  /* & - reference operator - returns the address */
  /* * - dereference operator */

  ptr = &num;
  printf("num=%d, %p, %d\n", num, (void *) &num, sizeof(num));
  printf("ptr=%p, %p, %d, *ptr=%d\n", (void *) ptr, (void *) &ptr, sizeof(ptr), *ptr);


  /* *ptr is an alias of num */
  *ptr = 20; 
  printf("\n*ptr = 20\n");
  printf("num=%d, %p, %d\n", num, (void *) &num, sizeof(num));
  printf("ptr=%p, %p, %d, *ptr=%d\n", (void *) ptr, (void *) &ptr, sizeof(ptr), *ptr);

  printf("\n");
  printf("ptr=%p\n", (void *) ptr);
  printf("&(*ptr)=%p\n", (void *) &(*ptr));
  printf("*(&ptr)=%p\n", (void *) *(&ptr));
  printf("num=%d\n", num);
  printf("*(&num)=%d\n", *(&num));

  return 0;
}
