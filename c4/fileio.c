#include<stdio.h>
#include<string.h>

#define BUFFLEN 85

int main ()
{
  FILE *fp;
  char buffer[BUFFLEN];

  fp = fopen("test.txt", "r");  /* modes: "r", "w", "a" */

  while ( fgets(buffer, BUFFLEN, fp))  {
    if (strncmp(buffer, "Part 2", 6) == 0)
      printf("C is my favorite!\n");
    else
      fputs(buffer,stdout);  /* print to stdout */
  }

  fclose(fp);

  return 0;
}
