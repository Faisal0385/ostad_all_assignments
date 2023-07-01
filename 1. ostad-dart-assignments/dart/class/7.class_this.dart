/// DART THIS KEYWORD
// It indicates the current instance of the class, methods, or constructor.
// The this keyword is used to refer the current class object.

void main(){
  Student studentObj = Student("Faisal A Salam");
}

class Student{

  late String name;

  Student(this.name){
    this.studing();
  }

  studing(){
    print("My name is ${this.name}");
  }

}