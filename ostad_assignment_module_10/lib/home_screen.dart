import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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

Widget landscapeMode() {
  return Row(
    children: [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: SizedBox(
          height: 200,
          width: 200,
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz9uuLzKtya3Wx-R4iId-flA2-reZvwg1E1ZjfZZ0il_7Q3D9tV2GAdHBptKzsWJr9K20&usqp=CAU'),
          ),
        ),
      ),

      Expanded(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Faisal A Salam",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqeZ5mVbarupP8UWVic7UtumtbIyE0GY-ucQ&usqp=CAU"),
                    );
                  }),
            ),
          ],
        ),
      ),


    ],
  );
}

Widget portraitMode() {
  return Column(
    children: [
      Container(
        height: 200,
        width: 200,
        child: const CircleAvatar(
          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz9uuLzKtya3Wx-R4iId-flA2-reZvwg1E1ZjfZZ0il_7Q3D9tV2GAdHBptKzsWJr9K20&usqp=CAU'),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Faisal A Salam",
          style: TextStyle(fontSize: 30),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          textAlign: TextAlign.justify,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqeZ5mVbarupP8UWVic7UtumtbIyE0GY-ucQ&usqp=CAU"));
            }),
      )
    ],
  );
}
