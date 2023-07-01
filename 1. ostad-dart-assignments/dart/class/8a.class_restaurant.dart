class Restaurant {

  // Making a variable private
  int _id;

  Restaurant(this._id) {
    _shopping();
  }

  // Interface
  String order(item) {
    _prepareItem(item);
    return "$item is served.";
  }

  /// Private/ Implementation
  void _prepareItem(item) {
    print("Make this $item");
  }

  /// Private/ Implementation
  void _shopping() {
    print("Buying Grocery Items");
  }

  /// Creating a getters method
  // 1.
  // int get resId {
  //   print(_id);
  // }

  // 2.
  int get resId => _id;


  // int getId() => _id;

  // if we do like this it will replace the value
  // getId(id){
  //   _id = id;
  //   print(_id);
  // }
}
