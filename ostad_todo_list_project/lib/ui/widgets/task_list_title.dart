// import 'package:flutter/material.dart';
//
// class TaskListTitle extends StatelessWidget {
//   const TaskListTitle({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("This is a title"),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Sub title"),
//           Row(
//             children: [
//               Chip(
//                 label: Text(
//                   "New",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 backgroundColor: Colors.blueAccent,
//               ),
//               Spacer(),
//               IconButton(onPressed: (){
//               }, icon: Icon(Icons.edit, color: Colors.green.shade300,)),
//               IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: Colors.red.shade300)),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ostad_todo_list_project/data/models/task_list_model.dart';

class TaskListTitle extends StatelessWidget {
  final VoidCallback onDeleteTap, onEditTap;

  const TaskListTitle({
    super.key,
    required this.data,
    required this.onDeleteTap,
    required this.onEditTap,
  });

  final TaskData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title ?? 'Unknown'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.description ?? ''),
          Text(data.createdDate ?? ''),
          Row(
            children: [
              Chip(
                label: Text(
                  data.status ?? 'New',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              const Spacer(),
              IconButton(
                onPressed: onDeleteTap,
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red.shade300,
                ),
              ),
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
