import 'package:flutter/material.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/delete_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_cancel_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_completed_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_new_tasks_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/get_progress_task_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/summary_count_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/update_profile_controller.dart';
import 'package:ostad_todo_list_getx_project/ui/state_managers/update_task_controller.dart';
import '/ui/state_managers/signup_controller.dart';
import '/ui/state_managers/login_controller.dart';
import '/ui/screens/splash_screen.dart';
import 'package:get/get.dart';

class TaskManagerApp extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const TaskManagerApp({Key? key}) : super(key: key);

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: TaskManagerApp.globalKey,
      title: 'Task Manager',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        )),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        )),
      ),
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinding(),
      home: const SplashScreen(),
    );
  }
}

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignUpController>(SignUpController());
    Get.put<SummaryCountController>(SummaryCountController());
    Get.put<GetNewTasksController>(GetNewTasksController());
    Get.put<DeleteTaskController>(DeleteTaskController());
    Get.put<UpdateTaskController>(UpdateTaskController());
    Get.put<GetProgressTaskController>(GetProgressTaskController());
    Get.put<GetCompletedTaskController>(GetCompletedTaskController());
    Get.put<GetCancelTaskController>(GetCancelTaskController());
  }
}
