import 'package:flutter/material.dart';
import 'package:task_manager_app/screens/onboarding/email_verification.dart';
import 'package:task_manager_app/screens/onboarding/login_screen.dart';
import 'package:task_manager_app/screens/onboarding/pin_verification_screen.dart';
import 'package:task_manager_app/screens/onboarding/registration_screen.dart';
import 'package:task_manager_app/screens/onboarding/set_password_screen.dart';
import 'package:task_manager_app/screens/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager App',
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/login' : (context) => const LoginScreen(),
        '/registration' : (context) => const RegistrationScreen(),
        '/emailVerification' : (context) => const EmailVerificationScreen(),
        '/pinVerification' : (context) => const PinVerificationScreen(),
        '/setPassword' : (context) => const SetPasswordScreen(),
      },
    );
  }
}