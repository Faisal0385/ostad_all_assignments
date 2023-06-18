// In the main() function, create three Car objects with different brands, models, and years.
main() {

  /// Car One Object
  Car toyota = Car("Toyota", "Toyota Crown", 2016);

  // Drive each car a different number of miles using the drive() method.
  toyota.drive(12.5);

  // Print out the brand, model, year, and miles driven for each car using the
  // getBrand(), getModel(), getYear(), and getMilesDriven() methods, respectively.
  print('Brand Name: ${toyota.getBrand()}');
  print('Model Name: ${toyota.getModel()}');
  print('Year: ${toyota.getYear()}');
  print('Get Miles Driven: ${toyota.getMilesDriven()}');

  // Also print out the age of each car using the getAge() method.
  print('Age of the car is: ${toyota.getAge()}');

  // Finally, print out the total number of Car objects created using the numberOfCars static property.
  print('Total number of Car objects created: ${Car.numberOfCars}');

  // For Gap
  print("           ");

  /// Car Two Object
  Car bmw = Car("BMW", "BMW 123", 2010);

  // Drive each car a different number of miles using the drive() method.
  bmw.drive(30.0);

  // Print out the brand, model, year, and miles driven for each car using the
  // getBrand(), getModel(), getYear(), and getMilesDriven() methods, respectively.
  print('Brand Name: ${bmw.getBrand()}');
  print('Model Name: ${bmw.getModel()}');
  print('Year: ${bmw.getYear()}');
  print('Get Miles Driven: ${bmw.getMilesDriven()}');

  // Also print out the age of each car using the getAge() method.
  print('Age of the car is: ${bmw.getAge()}');

  // Finally, print out the total number of Car objects created using the numberOfCars static property.
  print('Total number of Car objects created: ${Car.numberOfCars}');

  // For Gap
  print("           ");

  /// Car Three Object
  Car tesla = Car("Tesla", "Tesla 123", 2000);

  // Drive each car a different number of miles using the drive() method.
  tesla.drive(100.0);

  // Print out the brand, model, year, and miles driven for each car using the
  // getBrand(), getModel(), getYear(), and getMilesDriven() methods, respectively.
  print('Brand Name: ${tesla.getBrand()}');
  print('Model Name: ${tesla.getModel()}');
  print('Year: ${tesla.getYear()}');
  print('Get Miles Driven: ${tesla.getMilesDriven()}');

  // Also print out the age of each car using the getAge() method.
  print('Age of the car is: ${tesla.getAge()}');

  // Finally, print out the total number of Car objects created using the numberOfCars static property.
  print('Total number of Car objects created: ${Car.numberOfCars}');
}

// Create a class with name Car:
class Car {
  // brand: a string representing the brand of the car
  String brand;

  // model: a string representing the model of the car
  String model;

  // year: an integer representing the year the car was made
  int year;

  // milesDriven: a double representing the number of miles driven by the car
  late double milesDriven;

  // ★ The class should also have a static property called numberOfCars that keeps track
  // of the number of Car objects that have been created. This property should be
  // incremented every time a Car object is created.
  static int numberOfCars = 0;

  // Constructor
  Car(this.brand, this.model, this.year) {
    numberOfCars++;
  }

  // The class should have the following methods:

  // ● drive(double miles): a method that takes a double parameter representing the
  // number of miles driven and adds it to the milesDriven property
  double drive(double miles) =>  this.milesDriven = miles;

  // ● getMilesDriven(): a method that returns the value of the milesDriven property
  getMilesDriven() => this.milesDriven;

  // ● getBrand(): a method that returns the value of the brand property
  getBrand() => this.brand;

  // ● getModel(): a method that returns the value of the model property
  getModel() => this.model;

  // ● getYear(): a method that returns the value of the year property
  getYear() => this.year;

  // ● getYear(): a method that returns the value of the year property
  var currDt = DateTime.now();
  getAge() => currDt.year - this.year;
}


