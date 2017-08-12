#include <stdio.h>
 
#define LEN 100
 
int main() {
  int num_spaces = 0;
  char str[LEN];
  int ii=0;
 
  printf("Enter a string: ");
  fgets(str, LEN, stdin);     /* Get a string from input, store it in str */
 
  printf("Your string is: %s", str);
  while ((ii < LEN) && (str[ii] != '\0')) {
     if (str[ii] == ' ') {
       num_spaces ++;
     }
     ii++;
  }
  printf("Your string has %d spaces\n", num_spaces);
  return 0;
}
