import 'package:flutter/material.dart';
import 'package:smart_calculator/model/cash_flow_model.dart';
import 'package:smart_calculator/screens/calculator_screen.dart';
import 'package:smart_calculator/screens/customer_screen.dart';
import 'package:smart_calculator/services/database_helper.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CalculaC"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [Text("Today's Credit"), Text("3000")],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [Text("Today's Debit"), Text("200")],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [Text("Total Amount"), Text("5000")],
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Transitions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<CashFlow>?>(
                future: DatabaseHelper.getAllCashFlows(),
                builder: (context, AsyncSnapshot<List<CashFlow>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              leading: const Icon(Icons.monetization_on),
                              title: Text('Amount ${snapshot.data![index].cash}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Status ${snapshot.data![index].status}"),
                                  Text(
                                      "${snapshot.data![index].date}"),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Are you sure you want to delete this note?'),
                                        actions: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red)),
                                            onPressed: () async {
                                              await DatabaseHelper.deleteCash(
                                                  snapshot.data![index]);
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            child: const Text('Yes'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('No'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }
                  return const Center(
                    child: Text('No notes yet'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('CalculaC'),
            ),
            ListTile(
              title: const Text("Smart Cal"),
              leading: const Icon(Icons.calculate),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculatorScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2),
              title: const Text("Customer"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomerScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_document),
              title: const Text("Reports"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: "Calculator",
              backgroundColor: Colors.deepOrangeAccent),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: "Calculator",
              backgroundColor: Colors.deepOrangeAccent),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: "Calculator",
              backgroundColor: Colors.deepOrangeAccent),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: "Calculator",
              backgroundColor: Colors.deepOrangeAccent),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const CalculatorScreen()),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
