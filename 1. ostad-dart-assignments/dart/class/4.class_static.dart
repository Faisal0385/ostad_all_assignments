void main() {
  /// CREATED 1ST OBJECT
  Mobile mobile1 = Mobile();

  // Accessing Static Value
  Mobile.shopName = 'E-shoppers';

  mobile1.name = 'iPhone';
  mobile1.model = 'iPhone 11 Pro';
  mobile1.price = 70000;

  // Printing Values
  print(mobile1.name);
  print(mobile1.model);
  print(mobile1.price);

  print('    ');

  /// CREATED 2ND OBJECT
  Mobile mobile2 = Mobile();

  // Accessing Static Value
  Mobile.shopName = 'MediMax';

  mobile2.name = 'Samsung';
  mobile2.model = 'Samsung Pro';
  mobile2.price = 60000;

  // Printing the values
  print(mobile2.name);
  print(mobile2.model);
  print(mobile2.price);

  print('    ');

  // Printing Static Values
  print('Current Shop Name: ${Mobile.shopName}');

  // Printing Static Function/Method
  Mobile.country();


}

class Mobile {
  static late String shopName;

  late String name;
  late String model;
  late double price;

  static country(){
    print("Bangladesh");
  }
}
