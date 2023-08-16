import 'package:get/get.dart';
import '/data/models/network_response.dart';
import 'package:ostad_todo_list_getx_project/data/services/network_caller.dart';
import 'package:ostad_todo_list_getx_project/data/utils/urls.dart';

class UpdateTaskController extends GetxController {
  bool updateTaskInProgress = false;

  Future<bool> updateTask(String taskId, String newStatus) async {
    updateTaskInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.updateTask(taskId, newStatus));
    updateTaskInProgress = false;
    update();
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
