import 'package:flutter/material.dart';
import 'package:live_test_module_10/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Live Test M-10',
      home: HomeScreen(),
    );
  }
}
