#include<stdio.h>

int main () {
  char *p = "Hello"; 
  char *s = "this is a string";
  char t[] = "Also a string";

  printf("\n==== print string ====\n");
  printf("p: [%p] %p, %s\n", (void *) &p, (void *) p, p);
  printf("s: [%p] %p, %s\n", (void *) &s, (void *) s, s);
  printf("t: [%p] %p, %s\n", (void *) &t, (void *) t, t);

  printf("\n==== print character ====\n");
  printf("p: [%p] %c [%d]\n", (void *) &p, *p, *p);
  printf("s: [%p] %c [%d]\n", (void *) &s, *s, *s);
  printf("t: [%p] %c [%d]\n", (void *) &t, *t, *t);

  printf("\n==== print string+1 ====\n");
  printf("p: [%p] %p, %s\n", (void *) &p, (void *) p, (p+1));
  printf("s: [%p] %p, %s\n", (void *) &s, (void *) s, (s+1));
  printf("t: [%p] %p, %s\n", (void *) &t, (void *) t, (t+1));

  printf("\n==== print character+1 ====\n");
  printf("p: [%p] %c\n", (void *) &p, *(p+1));
  printf("s: [%p] %c\n", (void *) &s, *(s+1));
  printf("t: [%p] %c\n", (void *) &t, *(t+1));

  printf("\n==== pointer arithmetic vs array indexing ====\n");
  printf("s: [%p] %c\n", (void *) &s, *(s+12));
  printf("s: [%p] %c\n", (void *) &s, s[12]);

  printf ("\nPrint using pointer increment : s=p\n");
  s = p;
  while (*s != '\0') {
    printf("[%c]", *s);
    s++;
  }

  printf("\n");

  return 0;
}
