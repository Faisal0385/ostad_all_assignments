main() {
  /// Data
  /// Data Type
  /// Primitive Data Type - String, int, double, bool
  /// Variable
  /// strictly-typed

  /*
  1. string - text/multiple characters/letters like "Bangladesh"
  2. number -
      integer - 36
      decimal - 23.50
  3. boolean - true/false
   */

  /// To Help A Banking Application
  String FirstName = 'Faisal';
  String LastName = 'A. Salam';
  String accountHolderFullName =
      FirstName + ' ' + LastName; // string - set of characters
  String accountHolderAddress = "53/5, Muradpur, Chittagong";
  String accountHolderCompanyName = '''KAF Tech BD
  - Quality is our Priority.''';
  int accountHolderAge = 36; // integer number
  double totalAmount = 400000.50; // decimal number
  bool isAccountHolderBangladeshi = true; // boolean true/false

  /// Multiple Phone Numbers
  List<String> phoneNumberList = [
    '+8801812361494',
    '+8801812361495',
    '+8801812361496',
    '+8801812361497'
  ];

  /// Map - dynamic
  Map studentNameList = {
    101: "Faisal",
    102: "Fahad",
    103: "Fahim",
    104: "Fatima",
    104: "Farzana",
  };

  /// Map - with data type
  Map<int, String> studentNameRollWise = {
    201: "Jhon",
    202: "Doe",
    203: "Cyndy",
    204: "Jose",
  };

  /// Print all the above variable
  print(accountHolderFullName);
  print(accountHolderAddress);
  print(accountHolderCompanyName);
  print(accountHolderAge);
  print(totalAmount);
  print(isAccountHolderBangladeshi);

  print(phoneNumberList);
  print(phoneNumberList[0]);

  /// Map - dynamic
  print(studentNameList);

  /// Map - with data type
  print(studentNameRollWise);

}
