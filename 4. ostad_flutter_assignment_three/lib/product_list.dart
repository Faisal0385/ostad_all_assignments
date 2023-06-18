import 'package:flutter/material.dart';
import 'package:ostad_assigment_three/cart_page.dart';

///1. A stateful widget called ProductList that displays a list of products
class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ///2. Each product should have a name, price
  List productListItems = [
    {"product_name": "Product 1", "price": "\$10.00", "qty": "0"},
    {"product_name": "Product 2", "price": "\$15.00", "qty": "0"},
    {"product_name": "Product 3", "price": "\$20.00", "qty": "0"},
    {"product_name": "Product 4", "price": "\$30.00", "qty": "0"},
    {"product_name": "Product 5", "price": "\$10.00", "qty": "0"},
    {"product_name": "Product 6", "price": "\$15.00", "qty": "0"},
    {"product_name": "Product 7", "price": "\$20.00", "qty": "0"},
    {"product_name": "Product 8", "price": "\$30.00", "qty": "0"},
    {"product_name": "Product 9", "price": "\$10.00", "qty": "0"},
    {"product_name": "Product 10", "price": "\$15.00", "qty": "0"},
    {"product_name": "Product 11", "price": "\$12.50", "qty": "0"},
    {"product_name": "Product 12", "price": "\$10.60", "qty": "0"},
  ];

  int totalNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: const Text(
          "Product List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartPage(
                      totalNum: totalNum,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: productListItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(productListItems[index]['product_name']),
              subtitle: Text("Price: ${productListItems[index]['price']}"),
              trailing: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///3 Implement a counter for each product that increments by 1 every time the "Buy Now" button is pressed.
                    Text("Counter: ${productListItems[index]['qty']}"),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          if (int.parse(productListItems[index]['qty']) < 5) {
                            int newNum =
                                int.parse(productListItems[index]['qty']);
                            newNum++;
                            productListItems[index]['qty'] = newNum.toString();
                            totalNum++;
                          }

                          if (int.parse(productListItems[index]['qty']) == 5) {
                            ///4 show a dialog box with the message
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Congratulations!"),
                                  content: Text(
                                      "You've bought 5 of ${productListItems[index]['product_name']}!"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                );
                              },
                            );
                          }

                          setState(() {});
                        },

                        /// a "Buy Now" button.
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartPage(
                totalNum: totalNum,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
