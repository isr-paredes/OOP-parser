class Animal {
public:
    virtual void speak();
};

class Dog : public Animal {
public:
    void speak() override;
};
