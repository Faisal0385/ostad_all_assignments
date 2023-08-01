import '/app/views/auth/signin/signin_screen.dart';
import '/app/views/dashboard/admin_dashboard/admin_dashboard_screen.dart';
import '/app/views/dashboard/user_dashboard/user_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/app/constants/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLogin() {
    Future.delayed(const Duration(seconds: 3)).then((value){
      bool isLoggedIn = GetStorage().read(IS_LOGGED_IN) ?? false;

      if (isLoggedIn) {
        bool userLoggedIn = GetStorage().read(USER_LOGGED_IN) ?? false;
        if (userLoggedIn) {
          //user dashboard
          Get.offAll(() => const UserDashboardScreen());
        } else {
          //admin dashboard
          Get.offAll(() => const AdminDashboardScreen());
        }
      } else {
        Get.offAll(() => const SigninScreen());
      }
    });


  }

  @override
  void initState() {
    super.initState();
    checkLogin();
    if(mounted){
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/splash_logo.png',
            width: 100.w,
            height: 100.w,
          ),
        ),
      ),
    );
  }
}
