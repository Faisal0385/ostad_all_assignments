// Hints
// - Define the class constructor inside the class definition using the className() syntax.
// - Use this keyword to refer to the instance variables inside the constructor and methods.
// - Use the print() function to print output to the console.
// - To call a method of an object, use the dot notation: objectName.methodName().
// - To access a property of an object, use the dot notation: objectName.propertyName.
// - Age in months = age * 12


// Use this keyword to refer to the instance variables inside the constructor and methods.
// In the main() function, create an object of the Person class and initialise it with your own
// name, age, and address. Call the sayHello() method to check if it prints the correct output
// to the console. Call the getAgeInMonths() method and print the result to the console.
void main() {
  // Create a new Person object
  Person person = Person('Faisal A Salam', 36, "Chowkbazar, CTG, Bangladesh");

  person.sayHello();
  print("My address is: ${person._address}");
  print("My Age in months: ${person.getAgeInMonths()}");
}

class Person {
  late String _name;
  late int _age;
  late String _address;

  // The class should also have a constructor that takes in the name, age, and address parameters.
  Person(this._name, this._age, this._address);

  // - sayHello(): a method that prints "Hello, my name is $yourName." to the console
  sayHello(){
    print("Hello, my name is ${this._name}.");
  }

  // - getAgeInMonths(): a method that returns the age of the person in months
  int getAgeInMonths(){
    int ageInMonths = this._age * 12;
    return ageInMonths;
  }
}
