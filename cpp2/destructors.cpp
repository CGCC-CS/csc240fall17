#include<iostream>

using namespace std;

class myClass {
  public:
    int *a;
  private:
    int b;

  public:
  // Constructor
  myClass(int x) {
    static int counter = 1;

    a = new int;
    *a = x;
    b = counter;
    counter ++;
    cout << "  Constructor " << b << ": " << *a << " (" << a << ")" << endl;
  }

  // Copy constructor
  myClass(const myClass& original) {
    a = new int;
    *a = *(original.a);
    b = original.b * 10; 
    cout << "  Copy constructor " << b << ": " << *a << " (" << a << ")" << endl;
  }

  // Destructor
  ~myClass() {
    cout << "  Destructor " << b << ": " << *a << " (" << a << ")" << endl;
    delete a;
    a = nullptr;
  }

  void print(string s) {
    cout << "  object " << b << ": " << s << "  " <<*a << " (" << a << ")" << endl;
  }
};

void func(myClass k) {
  cout << "    ++++++++++++ start func ++++++++++++ " << endl;
  cout << "    FUNC: begin declare c3" << endl;
  myClass c3(3);
  cout << "    FUNC: done declare c3" << endl;
  cout << "    FUNC: ";
  *k.a = 4;
  k.print("k");
  cout << "    FUNC: ";
  c3.print("c3");
  cout << "    ++++++++++++  end func  ++++++++++++ " << endl;
}

int main () {
  cout << "MAIN: start" << endl;
  cout << "MAIN: begin declare c1" << endl;
  myClass c1(1);
  cout << "MAIN: done declare c1" << endl;
  cout << "MAIN: begin declare *c2" << endl;
  myClass *c2;
  cout << "MAIN: done declare *c2" << endl;
  cout << "MAIN: begin allocate *c2" << endl;
  c2 = new myClass(2);
  cout << "MAIN: done allocate *c2" << endl;

  cout << "MAIN: call func(c1)" << endl;
  func(c1);
  cout << "MAIN: return from func(c1)" << endl;

  cout << "MAIN: begin delete *c2" << endl;
  delete c2;
  cout << "MAIN: done delete *c2" << endl;

  cout << "MAIN: print c1 after function call" << endl;
  c1.print("end of main");

  cout << "MAIN: exit" << endl;
  return 0;
}
