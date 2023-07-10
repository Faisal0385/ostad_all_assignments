import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _listData = [];

  Future<void> ReadJsonData() async {
    final String jsonData = await rootBundle.loadString("assets/recipes.json");
    final data = await json.decode(jsonData);
    _listData = data['recipes'];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Recipes"),
      ),
      body: ListView.builder(
          itemCount: _listData.length,
          itemBuilder: (c, index) {
            return ListTile(
              title: Text(_listData[index]['title']),
              leading: const Icon(Icons.image),
              subtitle: Text(_listData[index]['description']),
            );
          }),
    );
  }
}
