import 'package:flutter/material.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/delete_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_progress_task_controller.dart';
import '/data/models/task_list_model.dart';
import '/ui/screens/update_task_status_sheet.dart';
import '/ui/widgets/task_list_title.dart';
import '/ui/widgets/user_profile_banner.dart';
import 'package:get/get.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  final GetProgressTaskController _getProgressTaskController =
      Get.find<GetProgressTaskController>();

  final DeleteTaskController _deleteTaskController =
      Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getProgressTaskController.getInProgressTasks();
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
            GetBuilder<GetProgressTaskController>(builder: (_) {
              if (_getProgressTaskController.getProgressTasksInProgress) {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              }
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _getProgressTaskController.getInProgressTasks();
                  },
                  child: ListView.separated(
                    itemCount:
                        _getProgressTaskController.taskListModel.data?.length ??
                            0,
                    itemBuilder: (context, index) {
                      return TaskListTitle(
                        data: _getProgressTaskController
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
                                        _getProgressTaskController
                                            .taskListModel.data![index].sId!),
                                    Get.back(),
                                    _getProgressTaskController
                                        .getInProgressTasks(),
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        onEditTap: () {
                          showStatusUpdateBottomSheet(_getProgressTaskController
                              .taskListModel.data![index]);
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
            }),
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
            _getProgressTaskController.getInProgressTasks();
          },
        );
      },
    );
  }
}
