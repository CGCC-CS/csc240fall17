#include<stdio.h>

#define NUM 10  /* Macro / symbolic constant */

/* enumeration constant */
typedef enum {TEN=10, TWENTY=20} numbers_t;

int main () {
  const int my_const = NUM * 2;    /* constant variable */
  int *j = &my_const;    /* This gives compile warning! */
  int * sneaky_ptr = (int *) &j;
  numbers_t k = TEN;
  const int *p = &my_const;
  int my_int = 30;

  printf("Before\n");
  printf("my_const=%d  [%p]\n", my_const, (void *) &my_const);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("k=%d  [%p]\n", k, (void *) &k);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("TEN=%d\n", TEN);
  printf("NUM=%d\n", NUM);

  /* NOT ALLOWED:
  my_const++;    Modifying a constant variable
  NUM++;         Modifying symbolic constants
  TEN++;         Modifying an enum constnat
  (*p)++;        Using const pointer to modify a value
  *(&my_const) = 10;  Dereferencing address of my_const
  */

  /* ALLOWED: changing what a const pointer points to */
  p =  &my_int;

  /* NOT ALLOWED: changing a non-constant variable with a const pointer */
  /*  (*p)++; */

  (*j)++; 
  printf("\n\nAfter (*j)++\n");
  printf("my_const=%d  [%p]\n", my_const, (void *) &my_const);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("k=%d  [%p]\n", k, (void *) &k);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("TEN=%d\n", TEN);
  printf("NUM=%d\n", NUM);

  sneaky_ptr --;
  (*sneaky_ptr) ++;
  printf("\n\nAfter (*sneaky_ptr)++\n");
  printf("my_const=%d  [%p]\n", my_const, (void *) &my_const);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("k=%d  [%p]\n", k, (void *) &k);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("TEN=%d\n", TEN);
  printf("NUM=%d\n", NUM);

  return 0;
}
