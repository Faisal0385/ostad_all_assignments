import 'package:flutter/material.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/delete_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_new_tasks_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/summary_count_controller.dart';
import '/data/models/task_list_model.dart';
import '/ui/screens/add_new_task_screen.dart';
import '/ui/screens/update_task_bottom_sheet.dart';
import '/ui/screens/update_task_status_sheet.dart';
import '/ui/widgets/screen_background.dart';
import '/ui/widgets/summary_card.dart';
import '/ui/widgets/task_list_title.dart';
import '/ui/widgets/user_profile_banner.dart';
import 'package:get/get.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskListModel _taskListModel = TaskListModel();

  final SummaryCountController _summaryCountController =
      Get.find<SummaryCountController>();
  final GetNewTasksController _getNewTasksController =
      Get.find<GetNewTasksController>();
  final DeleteTaskController _deleteTaskController =
      Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _summaryCountController.getCountSummary();
      _getNewTasksController.getNewTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          children: [
            const UserProfileBanner(),
            GetBuilder<SummaryCountController>(
              builder: (_) {
                if (_summaryCountController.getCountSummaryInProgress) {
                  return const Center(
                    child: LinearProgressIndicator(),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _summaryCountController
                                .summaryCountModel.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return SummaryCard(
                            title: _summaryCountController
                                    .summaryCountModel.data![index].sId ??
                                'Null',
                            number: _summaryCountController
                                    .summaryCountModel.data![index].sum ??
                                0,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 4,
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<GetNewTasksController>(builder: (_) {
              if (_getNewTasksController.getNewTaskInProgress) {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              }
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _getNewTasksController.getNewTasks();
                    _summaryCountController.getCountSummary();
                  },
                  child: ListView.separated(
                    itemCount:
                        _getNewTasksController.taskListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TaskListTitle(
                        data: _getNewTasksController.taskListModel.data![index],
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
                                        _getNewTasksController
                                            .taskListModel.data![index].sId!),
                                    // Navigator.pop(context, 'OK'),
                                    Get.back(),
                                    _getNewTasksController.getNewTasks(),
                                    _summaryCountController.getCountSummary(),
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        onEditTap: () {
                          // showEditBottomSheet(_taskListModel.data![index]);
                          showStatusUpdateBottomSheet(_getNewTasksController
                              .taskListModel.data![index]);
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 10,
                        color: Colors.green,
                      );
                    },
                  ),
                ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddNewTaskScreen());
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const AddNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showEditBottomSheet(TaskData task) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return UpdateTaskSheet(
          task: task,
          onUpdate: () {
            _getNewTasksController.getNewTasks();
          },
        );
      },
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
            _getNewTasksController.getNewTasks();
          },
        );
      },
    );
  }
}
