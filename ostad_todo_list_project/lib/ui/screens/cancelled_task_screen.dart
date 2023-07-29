import 'package:flutter/material.dart';
import 'package:ostad_todo_list_project/ui/widgets/task_list_title.dart';
import 'package:ostad_todo_list_project/ui/widgets/user_profile_banner.dart';

class CancelledTaskScreen extends StatelessWidget {
  const CancelledTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            const SizedBox( height: 30, ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
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
    );
  }
}
