import 'package:flutter/material.dart';

class TaskListTitle extends StatelessWidget {
  const TaskListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("This is a title"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sub title"),
          Row(
            children: [
              Chip(
                label: Text(
                  "New",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blueAccent,
              ),
              Spacer(),
              IconButton(onPressed: (){
              }, icon: Icon(Icons.edit, color: Colors.green.shade300,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: Colors.red.shade300)),
            ],
          )
        ],
      ),
    );
  }
}
