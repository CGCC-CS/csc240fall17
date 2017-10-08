#include<iostream>

using namespace std;

class MyBase {
  public:
    MyBase() { cout << "  MyBase constructor " << endl; }
    virtual ~MyBase() { cout << "  MyBase destructor " << endl; }
};

class MyClass : public MyBase {
  private:
    int * a;
  public:
    MyClass(int x=0) { 
      a = new int;
      *a = x;
      cout << "  MyClass Constructor: " << *a << endl;
    }
    ~MyClass() { 
      cout << "  MyClass Destructor: " << *a << endl; 
      delete(a);
    }
};

int main() {
  cout << "MAIN: start" << endl;
  cout << "MAIN: declare c1 (MyClass) - start" << endl;
  MyClass c1(1);
  cout << "MAIN: declare c1 (MyClass) - end" << endl;

  cout << "MAIN: declare c2 (MyBase *) - start" << endl;
  MyBase * c2;
  cout << "MAIN: declare c2 (MyBase *) - end" << endl;

  cout << "MAIN: allocate c2 (MyClass) - start" << endl;
  c2 = new MyClass(2);
  cout << "MAIN: allocate c2 (MyClass) - end" << endl;

  cout << "MAIN: delete c2 (MyBase * to MyClass) - start" << endl;
  delete(c2);
  c2 = nullptr;
  cout << "MAIN: delete c2 (MyBase * to MyClass) - end" << endl;

  cout << "MAIN: end" << endl;
  return 0;
}
