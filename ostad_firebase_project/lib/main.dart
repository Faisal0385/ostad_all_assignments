import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ostad_firebase_project/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BasketBallLiveScore());
}

class BasketBallLiveScore extends StatelessWidget {
  const BasketBallLiveScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
