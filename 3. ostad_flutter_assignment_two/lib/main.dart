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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// wrap container component
  myWrapContainer(context, String title, String imgUrl) {
    ///9. Each photo should be represented by an ElevatedButton or OutlineButton with an Image and caption below it.
    return ElevatedButton(
      onPressed: () {
        ///10. While clicking on each image there should be a Snackbar Showing message “Clicked on photo!”
        mySnackBar(context, "Clicked on photo!");
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(fit: BoxFit.fill, imgUrl),
          ),
          Container(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// List of title, subtitle & images
  List myList = [
    {
      'title': "Sample Photo 1",
      "sub_title": "Category 1",
      "image":
          "https://images.pexels.com/photos/1500610/pexels-photo-1500610.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      'title': "Sample Photo 2",
      "sub_title": "Category 2",
      "image":
          "https://images.pexels.com/photos/5323336/pexels-photo-5323336.jpeg?auto=compress&cs=tinysrgb&w=300"
    },
    {
      'title': "Sample Photo 3",
      "sub_title": "Category 3",
      "image":
          "https://images.pexels.com/photos/4203067/pexels-photo-4203067.jpeg?auto=compress&cs=tinysrgb&w=300",
    },
    {
      'title': "Sample Photo 4",
      "sub_title": "Category 4",
      "image":
          "https://images.pexels.com/photos/4915624/pexels-photo-4915624.jpeg?auto=compress&cs=tinysrgb&w=300"
    },
  ];

  /// SnackBar function
  mySnackBar(context, msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        /// The snack bar's background color.
        backgroundColor: Colors.deepOrangeAccent,

        /// The amount of time the snack bar should be displayed.
        duration: Duration(seconds: 1),

        /// To center the Item
        content: Center(
          /// Display the message
          child: Text(
            msg,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ///1. Create a Flutter app with a Scaffold as the root widget.
    return Scaffold(
      ///2. Implement an AppBar at the top with a title "Photo Gallery".
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Photo Gallery",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ///3. Inside the body of the Scaffold, create a SingleChildScrollView to enable scrolling.
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        ///4. Within the SingleChildScrollView, create a Column widget.
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              ///5. Inside the Column widget, add a Container to display a welcome message such as "Welcome to My Photo Gallery!
              child: Container(
                child: Text(
                  "Welcome to My Photo Gallery!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              ///6. Create a TextField for users to search for specific photos. Use appropriate styling and placeholder text. No search functionality needed just design the TextField.
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 30,
              runSpacing: 10,
              children: [
                ///8. The images must be Network Images. You can choose any network image as you like.
                // There must be at least 6 images in the Wrap Widget.
                myWrapContainer(context, "Photo 1",
                    "https://images.pexels.com/photos/3878114/pexels-photo-3878114.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                myWrapContainer(context, "Photo 2",
                    "https://images.pexels.com/photos/4048392/pexels-photo-4048392.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                myWrapContainer(context, "Photo 3",
                    "https://images.pexels.com/photos/5366872/pexels-photo-5366872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                myWrapContainer(context, "Photo 4",
                    "https://images.pexels.com/photos/6129593/pexels-photo-6129593.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                myWrapContainer(context, "Photo 5",
                    "https://images.pexels.com/photos/6923716/pexels-photo-6923716.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                myWrapContainer(context, "Photo 6",
                    "https://images.pexels.com/photos/7445839/pexels-photo-7445839.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            ///11. Use a ListView to display a list of ListTile widgets below the photo grid.
            ListView.builder(
              shrinkWrap: true,
              itemCount: myList.length,
              itemBuilder: (context, index) {
                ///12. Each ListTile should represent a photo with a title and a subtitle.
                return ListTile(
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child:
                        Image.network(myList[index]['image'], fit: BoxFit.fill),
                  ),
                  title: Text(myList[index]['title']),
                  subtitle: Text(myList[index]['sub_title']),
                );
              },
            ),

            ///13. Implement a button, such as an IconButton, that when pressed, displays a SnackBar with the message "Photos Uploaded Successfully!".
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15),
                      ),
                    ),
                    onPressed: () {
                      mySnackBar(context, "Photos Uploaded Successfully!");
                    },
                    icon: Icon(
                      Icons.cloud,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
