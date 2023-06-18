import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignments/pages/page_three.dart';
import 'package:ostad_flutter_assignments/pages/page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://media.licdn.com/dms/image/C5603AQHkX5-u2txrRQ/profile-displayphoto-shrink_100_100/0/1597431148339?e=1691625600&v=beta&t=6QNyLZtF1FPzNk0TMegoAjJx2opCWuKKYX8kaT25FLQ"),
                ),
                accountName: Text("Faisal A. Salam"),
                accountEmail: Text("faisaltez@gmail.con"),
              ),

              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Page One"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const PageOne()));
                },
              ),

              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text("Page Two"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const PageTwo()));
                },
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Page Three"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const PageThree()));
                },
              ),

            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Ostad"),
          bottom: TabBar(
            tabs: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const PageOne()));
                },
                child: const Tab(
                  text: 'Page One',
                  icon: Icon(Icons.home),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const PageTwo()));
                },
                child: const Tab(
                  text: 'Page Two',
                  icon: Icon(Icons.shopping_bag),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const PageThree()));
                },
                child: const Tab(
                  text: 'Page Three',
                  icon: Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text(
            "Page One !!!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          elevation: 5,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const PageOne()));
                  },
                ),
                label: "Page One"),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.shopping_bag),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const PageTwo()));
                  },
                ),
                label: "Page Two"),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const PageThree()));
                  },
                ),
                label: "Page Three"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
