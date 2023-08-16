import 'package:flutter/material.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/delete_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_completed_task_controller.dart';
import '/data/models/task_list_model.dart';
import '/ui/screens/update_task_status_sheet.dart';
import '/ui/widgets/task_list_title.dart';
import '/ui/widgets/user_profile_banner.dart';
import 'package:get/get.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  // bool _getCompletedTasks = false;
  TaskListModel _taskListModel = TaskListModel();

  final GetCompletedTaskController _getCompletedTaskController =
      Get.find<GetCompletedTaskController>();
  final DeleteTaskController _deleteTaskController =
      Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCompletedTaskController.getCompletedTasks();
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
            GetBuilder(builder: (_) {
              if (_getCompletedTaskController.getCompletedTask) {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              }
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _getCompletedTaskController.getCompletedTask;
                  },
                  child: ListView.separated(
                    itemCount: _getCompletedTaskController
                            .taskListModel.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return TaskListTitle(
                        data: _getCompletedTaskController
                            .taskListModel.data![index],
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
                                      // Navigator.pop(context, 'Cancel'),
                                      Get.back(),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => {
                                    _deleteTaskController.deleteTask(
                                        _getCompletedTaskController
                                            .taskListModel.data![index].sId!),
                                    Get.back(),
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
              );
            })
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
            _getCompletedTaskController.getCompletedTasks();
          },
        );
      },
    );
  }
}
