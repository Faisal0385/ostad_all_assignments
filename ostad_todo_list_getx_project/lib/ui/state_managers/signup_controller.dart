import 'package:get/get.dart';
import 'package:ostad_todo_list_getx_project/data/models/network_response.dart';
import 'package:ostad_todo_list_getx_project/data/services/network_caller.dart';
import 'package:ostad_todo_list_getx_project/data/utils/urls.dart';

class SignUpController extends GetxController {
  bool _signUpInProgress = false;
  bool get signUpInProgress => _signUpInProgress;

  Future<bool> userSignUp(String email, firstname, lastname, mobile, password) async {
    _signUpInProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstname,
      "lastName": lastname,
      "mobile": mobile,
      "password": password,
      "photo": ""
    };

    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.registration, requestBody);
    _signUpInProgress = false;
    update();

    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }

}