import 'package:flutter/material.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/delete_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_cancel_task_controller.dart';
import '/data/models/task_list_model.dart';
import '/ui/screens/update_task_status_sheet.dart';
import '/ui/widgets/task_list_title.dart';
import '/ui/widgets/user_profile_banner.dart';
import 'package:get/get.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {

  final GetCancelTaskController _getCancelTaskController =
      Get.find<GetCancelTaskController>();

  final DeleteTaskController _deleteTaskController =
      Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCancelTaskController.getCanceledTasks();
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
            GetBuilder<GetCancelTaskController>(builder: (_){
              if (_getCancelTaskController.getCanceledTaskStatus) {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              }
              return Expanded(child: RefreshIndicator(
                onRefresh: () async{
                  _getCancelTaskController.getCanceledTasks();
                },
                child: ListView.separated(
                  itemCount:
                  _getCancelTaskController.taskListModel.data?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return TaskListTitle(
                      data: _getCancelTaskController
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
                                      _getCancelTaskController
                                          .taskListModel.data![index].sId!),
                                  Get.back(),
                                  _getCancelTaskController
                                      .getCanceledTasks(),
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      onEditTap: () {
                        // showEditBottomSheet(_taskListModel.data![index]);
                        showStatusUpdateBottomSheet(_getCancelTaskController
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
              ));
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
            _getCancelTaskController.getCanceledTasks();
          },
        );
      },
    );
  }
}
