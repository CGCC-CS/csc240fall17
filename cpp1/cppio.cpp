#include<iostream>
#include<string>

using namespace std;

int main() {
  int count;
  string str;

  cout << "Enter a number: ";
  cin >> count;

  cout << "Enter a string: ";
  cin >> str;   // Only gets characters until the next whitespace

  for(int ii=0;ii<count;ii++) {
    cout << ii << " : " << str << endl;
  }

  return 0;
}
