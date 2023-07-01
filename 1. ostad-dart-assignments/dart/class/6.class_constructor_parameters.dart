void main() {

  /// instance / object
  Mobile mobile1 = Mobile('iPhone', 'iPhone 12s');
  Mobile mobile2 = Mobile('Samsung', 'Samsung Pro');

  print(mobile1.name);
  print(mobile1.model);
  print('  ');
  print(mobile2.name);
  print(mobile2.model);
}

class Mobile {



  /// CREATING CLASS CONSTRUCTOR WITH PARAMETERS

  // 1.
  // late String name;
  // late String model;

  // Mobile(mobileName, mobileModel) {
  //   this.name = mobileName;
  //   this.model = mobileModel;
  // }

  // 2.
  String name;
  String model;

  Mobile(this.name, this.model);


}
