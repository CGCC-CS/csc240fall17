#include<stdio.h>

int main () {

  int arr[] = {1, 2, 3, 4, 5};
  int * ptr;
  int ii;

  ptr = arr;     /* equivalent ptr = &arr[0]; */

  /* array indexing */
  printf("array indexing:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", arr[ii]);
  }
  printf("\n");

  /* pointer arithmetic */
  printf("pointer arithmetic:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", *(ptr+ii));
  }
  printf("\n");

  /* array indexing with a pointer variable*/
  printf("array indexing with a pointer variable:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", ptr[ii]);
  }
  printf("\n");

  /* pointer arithmetic with an array name*/
  printf("pointer arithmetic with an array name:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", *(arr+ii));
  }
  printf("\n");

  printf("Are arrays and pointers the same?\n");
  printf("  size of arr=%d\n", sizeof(arr));
  printf("  size of ptr=%d\n", sizeof(ptr));

  /* you can assign a value to a pointer, not an array name */
  ptr=&ii;
  /*  arr=&ii; */  /* This doesn't work! */

  /* incrementing a pointer */
  ptr = arr;
  printf("incrementing a pointer :\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", *ptr);
    ptr++;
  }
  printf("\n");

  printf("incrementing an array - not allowed!:\n  ");
  /*
  for(ii=0;ii<5;ii++) {
    printf("%d ", *arr);
    arr++;
  }
  printf("\n");
  */

  return 0;
}
