import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:live_test_module_9/model.dart';
import 'package:flutter/services.dart' as rootBundle;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool inProgress = false;
  List listData = [];

  Future<List<Recipe>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('jsonFile/receipe.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => Recipe.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Recipes"),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("Got Error"),
            );
          } else if (data.hasData) {
            var items = data.data as List<Recipe>;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (c, i) {
              return ListTile(
                title: Text(items[i].title.toString()),
                leading: Icon(Icons.image),
                trailing: Text(items[i].description.toString()),
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
