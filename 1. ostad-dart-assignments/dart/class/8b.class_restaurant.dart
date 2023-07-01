import 'package:ostad_flutter_batch_practice/Class/8a.class_restaurant.dart';

void main(){
  Restaurant kfc = Restaurant(4588552);

  print(kfc.order("Burger"));
  // kfc._prepareItem('adsasd');

  // Printing a getters
  print(kfc.resId);


}

// class Shape {
//   void draw() {
//     print("Drawing shape...");
//   }
// }
// class Circle extends Shape {
//   @override
//   void draw() {
//     print("Drawing circle...");
//   }
// }
// void main() {
//   Circle myCircle = Circle();
//   myCircle.draw();
// }