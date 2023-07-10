import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool inProgress = false;


  void getWeatherData() async {
    inProgress = true;
    setState(() {});

    /// sending req to the api
    String API_URL = 'https://api.openweathermap.org/data/2.5/weather?lat=22.356852&lon=91.783180&appid=214762de3ae903c8d94aec011a7e994f';
    Response response = await get(Uri.parse(API_URL));
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    print(decodedResponse);


    inProgress = false;
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Test Module 9"),
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
