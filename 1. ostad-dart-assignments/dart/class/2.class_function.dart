void main(){

  /// instance / object created
  Person personObj = Person();

  /// ACCESSING (fullName) FUNCTION OF THE CLASS (Person)
  personObj.fullName();
}

/// CREATE A CLASS WITH NAME Person
class Person{

  String fname = 'Faisal';
  String lname = 'A. Salam';

  // function/method/behaviour declared
  fullName(){
    print('Fullname : ${this.fname} ${this.lname}');
  }

}