import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentation/ui/widgets/product_card.dart';
import '/presentation/ui/widgets/category_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Wishlist",
          style: TextStyle(color: Colors.blueGrey),
        ),
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCard());
            }),
      ),
    );
  }
}
