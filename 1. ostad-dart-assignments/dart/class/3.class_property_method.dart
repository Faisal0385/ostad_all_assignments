void main() {
  /// instance / object
  Mobile mobile = Mobile();

  mobile.name = 'iPhone'; // property access & assigned value
  mobile.model = 'iPhone 11'; // property access & assigned value
  mobile.price = 70000.00; // property access & assigned value

  print(mobile.name);
  print(mobile.model);
  print(mobile.price);

  /// ACCESSING (discountPriceFunction) FUNCTION OF THE CLASS (Mobile)
  /// AND Printing the value.
  // 1.
  print(mobile.discountPriceFunction(70000.00, 5000.00));
  // 2.
  print(mobile.discountPriceFunction(mobile.price, 5000.00));
}

/// Class Created
class Mobile {

  // property declared
  late String name;
  late String model;
  late double price;
  late int stock;

  // function/method/behaviour
  double discountPriceFunction (double currentPrice, double discountPrice) {
    double amount = currentPrice - discountPrice;
    return amount;
  }
}
