import 'package:get/get.dart';
import 'package:ostad_todo_list_getx_project/data/models/network_response.dart';
import 'package:ostad_todo_list_getx_project/data/models/task_list_model.dart';
import 'package:ostad_todo_list_getx_project/data/services/network_caller.dart';
import 'package:ostad_todo_list_getx_project/data/utils/urls.dart';

class GetCancelTaskController extends GetxController {
  bool _getCanceledTasks = false;
  TaskListModel _taskListModel = TaskListModel();

  bool get getCanceledTaskStatus => _getCanceledTasks;

  TaskListModel get taskListModel => _taskListModel;

  Future<bool> getCanceledTasks() async {
    _getCanceledTasks = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.canceledTasks);
    _getCanceledTasks = false;
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
