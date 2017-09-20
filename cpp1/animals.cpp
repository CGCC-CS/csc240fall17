#include<iostream>
#include<string>

using namespace std;

class Animal {
  protected:
    string n;
  public:
    Animal(string s="Animal") {n = s;}   // default value = Animal
 
    // Pure virtual method - must be overridden by any non-abstract
    //   derrived class.
    virtual void speak() = 0;

    // Virtual method - can be overridden by the child class.  The type of
    //   the object being pointed to determines the method that gets called.
    virtual void move() { cout << "I'm moving" << endl; }

    // Non-virtual method - can be overridden by the child class.  The 
    //   type of the pointer determines the method that gets called.
    void name() { cout << n << endl; }
};

class Dog : public Animal {
  public:
    Dog(string s="") : Animal(s) {}
    void speak() { cout << "Woof" << endl; }
    void move() { cout << "Run around." << endl; }
    void fetch() { cout << "Fetching!" << endl; }
};

class Cat : public Animal {
  public:
    Cat(string s="") : Animal(s) {}
    void speak() { cout << "Meow" << endl; }
};

int main() {
  // Animal a;   // Can't instantiate abstract type
  //Animal *aptr; 
  Animal *danimal, *canimal;
  Dog d("Lassie");
  Dog *dptr = &d;
  Cat c("Lucy");
  Cat *cptr = &c;

  // References
  Animal & animalRef = d;
  Cat & catRef = c;

  /* Animal is abstract - can't instantiate 
  cout << "Animal object:" << endl;
  a.speak();
  a.move();
  a.name();

  aptr = new Animal("Anotherone");
  cout << endl << "Animal pointer to Animal object:" << endl;
  aptr->speak();
  aptr->move();
  aptr->name();
  */

  cout << endl << "Dog object:" << endl;
  d.speak();
  d.move();
  d.name();
  d.fetch();

  cout << endl << "Dog pointer to Dog object:" << endl;
  dptr->speak();
  dptr->move();
  dptr->name();
  dptr->fetch();

  danimal = &d;
  cout << endl << "Animal pointer to Dog object:" << endl;
  danimal->speak();
  danimal->move();
  danimal->name();
  // danimal->fetch();   Animal pointer can't reference dog methods

  cout << endl << "Animal reference to Dog object:" << endl;
  animalRef.speak();
  animalRef.move();
  animalRef.name();

  cout << endl << "Cat object:" << endl;
  c.speak();
  c.move();
  c.name();

  cout << endl << "Cat pointer to Cat object:" << endl;
  cptr->speak();
  cptr->move();
  cptr->name();

  cout << endl << "Cat reference to Cat object:" << endl;
  catRef.speak();
  catRef.move();
  catRef.name();

  canimal = &c;
  cout << endl << "Animal pointer to Cat object:" << endl;
  canimal->speak();
  canimal->move();
  canimal->name();

  cout << endl << "Cat object:" << endl;
  c.speak();

  return 0;
}
