import 'package:flutter/material.dart';
import 'package:ostad_todo_list_project/data/models/auth_utility.dart';
import 'package:ostad_todo_list_project/ui/screens/add_new_task_screen.dart';
import 'package:ostad_todo_list_project/ui/widgets/summary_card.dart';
import 'package:ostad_todo_list_project/ui/widgets/task_list_title.dart';
import 'package:ostad_todo_list_project/ui/widgets/user_profile_banner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: "New",
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "Progress",
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "Cancelled",
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "Completed",
                      number: 123,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox( height: 20, ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskListTitle();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 4,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

