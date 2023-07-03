import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<ContactList> myContactList = [
    ContactList("Faisal", "faisal@gmail.com", "01312364556"),
    ContactList("Fahad", "fahad@gmail.com", "01412364556"),
    ContactList("Fahim", "fahim@gmail.com", "01512364556"),
    ContactList("Fatema", "fatema@gmail.com", "01112364556"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Module 8 Live Text"),
      ),
      body: ListView.separated(
          itemCount: myContactList.length,
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
          itemBuilder: (context, index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: (){
                    // The bottom sheet should show the task details
                    showDialogBoxWithDelete(context, index);
                  },
                  title: Text(
                    myContactList[index].name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            );

          }
      ),
    );
  }

  void showDialogBoxWithDelete(context, index) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Details:',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Name: ${myContactList[index].name}'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Email: ${myContactList[index].email}'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Phone Number: ${myContactList[index].contact}'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// making a contact list
class ContactList {
  String name, email, contact;

  ContactList(this.name, this.email, this.contact);
}