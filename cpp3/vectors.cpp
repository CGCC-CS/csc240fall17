#include<iostream>
#include<vector>

using namespace std;

int main () {
  vector<int> v(10);    // Create vector of size 10
  vector<int> v2 = {10, 20, 30};  // Initialize with an array
  vector<int> v3;      // Default initialization

  v = {1, 2, 3, 4};

  // Vector size vs. capacity
  cout << "Vector size: " << v.size() << endl;
  cout << "Vector capacity: " << v.capacity() << endl;
  cout << "Vector 2 size: " << v2.size() << endl;
  cout << "Vector 2 capacity: " << v2.capacity() << endl;
  cout << "Vector 3 size: " << v3.size() << endl;
  cout << "Vector 3 capacity: " << v3.capacity() << endl;

  cout << endl << "Print contents using array notation" << endl;  // UNSAFE
  for (unsigned int ii=0;ii < v.capacity()+10; ii++) {
    cout << v[ii] << ", ";
  }
  cout << endl;

  cout << "Print contents using at()" << endl;            // SAFE
  //for (unsigned int ii=0;ii < v.capacity(); ii++) {
  for (unsigned int ii=0;ii < v.size(); ii++) {
    cout << v.at(ii) << ", ";
  }

  //cout << endl << "Setting v[5] = 5" << endl;
  //v[4] = 5;  // Sets value, but does not change size
  cout << endl << endl << "Calling push_back" << endl;
  v.push_back(5);
  v.push_back(6);
  for (unsigned int ii=0;ii < v.size(); ii++) {
    cout << v.at(ii) << ", atat";
  }

  cout << endl << "Calling push_back when initialized with array" << endl;
  v2.push_back(40);
  v2.push_back(50);
  v2.push_back(60);
  for (unsigned int ii=0;ii < v2.size(); ii++) {
    cout << v2.at(ii) << ", ";
  }

  cout << endl << "Calling push_back on uninitialized vector" << endl;
  v3.push_back(-1);
  v3.push_back(-2);
  v3.push_back(-3);
  for (unsigned int ii=0;ii < v3.size(); ii++) {
    cout << v3.at(ii) << ", ";
  }

  cout << endl << "Calling push_back beyond initial capacity" << endl;
  for (unsigned int ii=0;ii < 10; ii++) {
    v.push_back(ii+7);
  }
  for (unsigned int ii=0;ii < v.size(); ii++) {
    cout << v.at(ii) << ", ";
  }
 
  cout << endl << " front: " << v.front() << endl;
  cout << " back: " << v.back() << endl; 

  cout << endl << "pop: " << endl;
  v.pop_back();
  // print vector using for-each
  for (auto& ii : v) {
    cout << ii << ", ";
  }

  cout << endl;
  return 0;
}
