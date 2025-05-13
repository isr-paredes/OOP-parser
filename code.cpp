#include <iostream>
#include <string>
using namespace std;

// Base class
class Animal {
protected:
    string name;

public:
    Animal(const string& n) : name(n) {}
    virtual void speak() const {
        cout << name << " makes a sound." << endl;
    }
    virtual ~Animal() {}
};

// Derived class: Dog
class Dog : public Animal {
public:
    Dog(const string& n) : Animal(n) {}
    void speak() const override {
        cout << name << " says: Woof!" << endl;
    }
};

// Derived class: Cat
class Cat : public Animal {
public:
    Cat(const string& n) : Animal(n) {}
    void speak() const override {
        cout << name << " says: Meow!" << endl;
    }
};

// Main function
int main() {
    Animal* animals[2];
    animals[0] = new Dog("Buddy");
    animals[1] = new Cat("Whiskers");

    for (int i = 0; i < 2; ++i) {
        animals[i]->speak();
        delete animals[i];
    }

    return 0;
}
