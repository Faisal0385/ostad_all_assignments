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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer: Include a banner with a custom message or image, and add two menu items
      // using ListTile widgets.
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.licdn.com/dms/image/C5603AQHkX5-u2txrRQ/profile-displayphoto-shrink_100_100/0/1597431148339?e=1691625600&v=beta&t=6QNyLZtF1FPzNk0TMegoAjJx2opCWuKKYX8kaT25FLQ"),
              ),
              accountName: Text("Faisal A Salam"),
              accountEmail: Text("faisaltez@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("About"),
              onTap: (){},
            ),
          ],
        ),
      ),

      // AppBar: Customize the AppBar's background color, elevation, center-aligned title,
      // and add at least two icons to the actions section.
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 20,
        centerTitle: true,
        title: Text("Ostad Test One"),
        actions: [
          Icon(Icons.search_rounded),
          Icon(Icons.settings),
        ],
      ),

      // Body: Customize the Scaffold's body with your preferred content, such as text,
      // images, or any other widget.
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.network(
                  "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"),
            ),
            SizedBox(
              child: Text("Test Image"),
            ),
          ],
        ),
      ),

      // Floating Action Button (FAB): Position the FAB in the bottom left corner, increase its
      // size, and change its color to a custom choice.
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          shape: new CircleBorder(),
          backgroundColor: Colors.teal,
          onPressed: () {},
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}