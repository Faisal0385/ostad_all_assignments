import 'package:flutter/material.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/update_task_controller.dart';
import '/data/models/task_list_model.dart';
import 'package:get/get.dart';

class UpdateTaskStatusSheet extends StatefulWidget {
  final TaskData task;
  final VoidCallback onUpdate;

  const UpdateTaskStatusSheet(
      {Key? key, required this.task, required this.onUpdate})
      : super(key: key);

  @override
  State<UpdateTaskStatusSheet> createState() => _UpdateTaskStatusSheetState();
}

class _UpdateTaskStatusSheetState extends State<UpdateTaskStatusSheet> {
  List<String> taskStatusList = ['New', 'Progress', 'Canceled', 'Completed'];
  late String _selectedTask;
  bool updateTaskInProgress = false;

  final UpdateTaskController _updateTaskController =
      Get.find<UpdateTaskController>();

  @override
  void initState() {
    _selectedTask = widget.task.status!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(16), child: Text('Update Status')),
          Expanded(
            child: ListView.builder(
                itemCount: taskStatusList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _selectedTask = taskStatusList[index];
                      setState(() {});
                    },
                    title: Text(taskStatusList[index].toUpperCase()),
                    trailing: _selectedTask == taskStatusList[index]
                        ? const Icon(Icons.check)
                        : null,
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Visibility(
              visible: updateTaskInProgress == false,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ElevatedButton(
                onPressed: () {
                  _updateTaskController
                      .updateTask(widget.task.sId!, _selectedTask)
                      .then((value) {
                    if (value == true) {
                      widget.onUpdate();
                      Get.back();
                      Get.snackbar("Success", "Update task status has been successful");
                    } else {
                      Get.snackbar("Failed", "Update task status has been failed");
                    }
                  });
                },
                child: const Text('Update'),
              ),
            ),
          )
        ],
      ),
    );
  }

}
