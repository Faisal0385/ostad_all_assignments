import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ostad_todo_list_project/data/models/auth_utility.dart';
import 'package:ostad_todo_list_project/data/models/network_response.dart';
import 'package:ostad_todo_list_project/data/models/task_list_model.dart';
import 'package:ostad_todo_list_project/data/services/network_caller.dart';
import 'package:ostad_todo_list_project/data/utils/urls.dart';
import 'package:ostad_todo_list_project/ui/screens/update_task_status_sheet.dart';
import 'package:ostad_todo_list_project/ui/widgets/task_list_title.dart';
import 'package:ostad_todo_list_project/ui/widgets/user_profile_banner.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  bool _getProgressTasksInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  Future<void> getInProgressTasks() async {
    _getProgressTasksInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.inProgressTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('In Progress Tasks Get Failed'),
          ),
        );
      }
    }

    _getProgressTasksInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getNewTasks() async {
    _getProgressTasksInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.inProgressTasks);
    if (response.isSuccess) {
      log(AuthUtility.userInfo.token.toString());
      log(response.statusCode.toString());
      log(response.body.toString());
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('In Progress Data Get Failed')));
      }
    }

    _getProgressTasksInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> deleteTask(String taskId) async {
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.deleteTask(taskId));
    if (response.isSuccess) {
      _taskListModel.data!.removeWhere((element) => element.sId == taskId);
      if (mounted) {
        setState(() {});
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Deletion Of Task Has Been Failed'),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getInProgressTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: _getProgressTasksInProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemCount: _taskListModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskListTitle(
                          data: _taskListModel.data![index],
                          onDeleteTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'Delete Task',
                                  style: TextStyle(color: Colors.green),
                                ),
                                content: const Text('Are You Sure?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => {
                                      deleteTask(
                                          _taskListModel.data![index].sId!),
                                      Navigator.pop(context, 'OK'),
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          onEditTap: () {
                            showStatusUpdateBottomSheet(
                                _taskListModel.data![index]);
                          },
                        );
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

  void showStatusUpdateBottomSheet(TaskData task) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return UpdateTaskStatusSheet(
            task: task,
            onUpdate: () {
              getNewTasks();
            });
      },
    );
  }
}
