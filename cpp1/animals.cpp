#include<iostream>

using namespace std;

class Animal {
  public: 
    // Pure virtual method - must be overridden by any non-abstract 
    //   derrived class.
    virtual void speak() = 0;

    // Virtual method - can be overridden by the derrived class.  The type of
    //   the object being pointed to determines the method that gets called.
    virtual void move() {
       cout << "I'm moving" << endl;
    }

    // Non-virtual method - can be overridden by the derrived class.  The 
    //   type of the pointer determines the method that gets called.
    void name() {
       cout << "Animal" << endl;
    }
};

class Dog : public Animal {
  public:
    void speak() {
       cout << "Woof!" << endl;
    }

    void move() {
       cout << "Run around." << endl;
    }

    void name() {
       cout << "Fluffy" << endl;
    }

    void fetch() {
       cout << "Fetching!" << endl;
    }
};

class Cat : public Animal {
  public:
    void speak() {
       cout << "Meow." << endl;
    }

    void name() {
       cout << "Snowflake" << endl;
    }

};

int main () {
  /*Animal a;*/
  Animal *a1;
  Dog d1, *d2;
  Cat c1, *c2;

  // References
  Animal & animalRef = d1; 
  Cat & catRef = c1;

  /* Cannot instantiate an abstract class 
  cout << "Animal object: " << endl;
  a.speak();
  a.move();
  a.name();
  */

  /*
  cout << endl << "Animal pointer pointing to animal object: " << endl;
  a1 = new Animal();
  a1->speak();
  a1->move();
  a1->name();
  */

  cout << endl << "Dog object: " << endl;
  d1.speak();
  d1.move();
  d1.name();

  cout << endl << "Dog pointer pointing to dog object: " << endl;
  d2 = new Dog();
  d2->speak();
  d2->move();
  d2->name();
  d2->fetch();

  cout << endl << "Animal pointer pointing to dog object: " << endl;
  a1 = &d1;
  a1->speak();
  a1->move();
  a1->name();

  cout << endl << "Animal reference referring to dog object: " << endl;
  animalRef.speak();
  animalRef.move();
  animalRef.name();

  cout << endl << "Cat object: " << endl;
  c1.speak();
  c1.move();
  c1.name();

  cout << endl << "Cat pointer pointing to cat object: " << endl;
  c2 = new Cat();
  c2->speak();
  c2->move();
  c2->name();

  cout << endl << "Cat reference referring to cat object: " << endl;
  catRef.speak();
  catRef.move();
  catRef.name();

  cout << endl << "Animal pointer pointing to cat object: " << endl;
  a1 = &c1;
  a1->speak();
  a1->move();
  a1->name();

  return 0;
}












