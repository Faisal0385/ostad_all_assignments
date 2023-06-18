import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key, required this.totalNum}) : super(key: key);
  final int totalNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Total Products: ${totalNum.toString()}",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
