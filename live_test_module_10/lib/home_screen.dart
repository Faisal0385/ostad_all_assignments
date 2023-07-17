import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Feed"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return portraitMode();
              } else {
                return landscapeMode();
              }
            },
          ),
        ),
      ),
    );
  }
}


Widget portraitMode() {
  return Column(
    children: [
      Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:500,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.network(
                            "https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2021/11/set-background-image-flutter-hero.jpeg?resize=950%2C500&ssl=1"),
                        const SizedBox(height: 10,),
                        const Text("Today's News")
                      ],
                    ),
                  ));
            }),
      )
    ],
  );
}

Widget landscapeMode() {
  return Row(
    children: [
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.network(
                                "https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2021/11/set-background-image-flutter-hero.jpeg?resize=950%2C500&ssl=1"),
                            const SizedBox(height: 10,),
                            const Text("Today's News")
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ],
  );
}


