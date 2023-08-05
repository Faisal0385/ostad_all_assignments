import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(onPressed: (){}, child: Text("+")),
                TextButton(onPressed: (){}, child: Text("-")),
                TextButton(onPressed: (){}, child: Text("/")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
