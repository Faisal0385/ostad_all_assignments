import 'package:get/get.dart';
import 'package:ostad_todo_list_getx_project/data/models/auth_utility.dart';
import 'package:ostad_todo_list_getx_project/data/models/login_model.dart';
import 'package:ostad_todo_list_getx_project/data/models/network_response.dart';
import 'package:ostad_todo_list_getx_project/data/services/network_caller.dart';
import 'package:ostad_todo_list_getx_project/data/utils/urls.dart';


class UpdateProfileController extends GetxController{
  UserData userData = AuthUtility.userInfo.data!;
  bool _profileInProgress = false;

  Future<bool> updateProfile(String firstname, lastname, mobile, email, password, photo) async {

    // email = userData.email ?? '';
    // firstname = userData.firstName ?? '';
    // lastname = userData.lastName ?? '';
    // mobile = userData.mobile ?? '';

    _profileInProgress = true;
    update();
    final Map<String, dynamic> requestBody = {
      "firstName": firstname,
      "lastName": lastname,
      "mobile": mobile,
      "photo": "",
    };
    if (password.isNotEmpty) {
      requestBody['password'] = password;
    }

    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.updateProfile, requestBody);
    _profileInProgress = false;
    update();
    if (response.isSuccess) {
      AuthUtility.updateUserInfo(userData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}