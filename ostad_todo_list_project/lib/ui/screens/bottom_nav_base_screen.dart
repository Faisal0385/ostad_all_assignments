import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_todo_list_project/ui/screens/cancelled_task_screen.dart';
import 'package:ostad_todo_list_project/ui/screens/completed_task_screen.dart';
import 'package:ostad_todo_list_project/ui/screens/in_progress_task_screen.dart';
import 'package:ostad_todo_list_project/ui/screens/new_task_screen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {

  int _selected_index = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
    CompletedTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selected_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected_index,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey
        ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        onTap: (int i){
          _selected_index = i;
          if(mounted){
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "New"),
          BottomNavigationBarItem(icon: Icon(Icons.account_tree), label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel"),
          BottomNavigationBarItem(icon: Icon(Icons.done_rounded), label: "Completed"),
        ],
      ),
    );
  }
}
