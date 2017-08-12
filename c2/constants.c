#include<stdio.h>

#define NUM 10  /* Macro / symbolic constant */

/* enumeration constant */
typedef enum {TEN=10, TWENTY=20} numbers_t;

int main () {
  const int i = NUM * 2;
  int *j = &i;  
  numbers_t k = TEN;
  const int *p = &i;

  printf("Before\n");
  printf("i=%d  [%p]\n", i, (void *) &i);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("k=%d  [%p]\n", k, (void *) &k);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("TEN=%d\n", TEN);
  printf("NUM=%d\n", NUM);


  /* NOT ALLOWED!:
  i++;
  NUM++;
  (*p)++;
  */

  (*j)++;  /* BAD! */
  p++;
  printf("\nAfter\n");
  printf("i=%d  [%p]\n", i, (void *) &i);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("k=%d  [%p]\n", k, (void *) &k);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("TEN=%d\n", TEN);
  printf("NUM=%d\n", NUM);

  return 0;
}
