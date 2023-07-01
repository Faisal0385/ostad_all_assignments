// CLASS CONSTRUCTOR DEFINITION:
// A constructor is a different type of function which is created with same name as its class name.
// The constructor is used to initialize an object when it is created.

void main() {
  /// instance / object
  Mobile mobile1 = Mobile();
  Mobile mobile2 = Mobile();
}

class Mobile {

  /// CREATING CLASS CONSTRUCTOR
  Mobile() {
    // Constructor execute automatically
    // Constructor has no return type
    // Constructor can have parameter
    print("Print Mobile Constructor");
  }

}
