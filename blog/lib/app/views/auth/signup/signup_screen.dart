import 'package:blog/app/views/auth/signin/signin_screen.dart';

import '/app/views/auth/forgot_password/forgot_password_screen.dart';
import '/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _signUpKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
          child: ListView(
            children: [
              SizedBox(
                height: 50.w,
              ),
              _signUpLogo(),
              SizedBox(
                height: 20.w,
              ),
              _signUpTitle(),
              SizedBox(
                height: 25.w,
              ),
              _nameField(),
              SizedBox(
                height: 15.w,
              ),
              _emailField(),
              SizedBox(
                height: 15.w,
              ),
              _passwordField(),
              SizedBox(
                height: 15.w,
              ),
              _nextButton(),
              SizedBox(
                height: 15.w,
              ),
              _signInForgotRow()
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInForgotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const SignInScreen());
          },
          child: Text(
            "Have an account? Sign In",
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  // Widget _signUpButton() {
  //   return ElevatedButton(
  //     onPressed: () {},
  //     child: Text(
  //       "Sign Up",
  //       style: TextStyle(
  //         fontSize: 15.sp,
  //       ),
  //     ),
  //   );
  // }

  Widget _nextButton() {
      return ElevatedButton(
        onPressed: () {},
        child: Text(
          "Next",
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      );
    }

  Widget _passwordField() {
    return TextFormField(
      controller: _passwordController,
      style: TextStyle(fontSize: 14.sp),
      obscureText: hidePassword,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor, width: 2),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.w),
          label: const Text("Password"),
          prefixIcon: const Icon(
            Icons.password,
            color: kBaseColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              hidePassword = !hidePassword;
              if (mounted) {
                setState(() {});
              }
            },
            icon: hidePassword
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          )),
      validator: MultiValidator([
        RequiredValidator(errorText: "Password is required"),
        MinLengthValidator(6, errorText: "Password must be 6 character long.")
      ]),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor, width: 2),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.w),
          label: const Text("Email"),
          prefixIcon: const Icon(
            Icons.email,
            color: kBaseColor,
          )),
      validator: MultiValidator([
        RequiredValidator(errorText: "Email is required"),
        EmailValidator(errorText: "Enter a valid email")
      ]),
    );
  }

  Widget _nameField() {
    return TextFormField(
      controller: _nameController,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor, width: 2),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.w),
          label: const Text("Full Name"),
          prefixIcon: const Icon(
            Icons.person,
            color: kBaseColor,
          )),
      validator: MultiValidator([
        RequiredValidator(errorText: "Full Name is required"),
        MinLengthValidator(3, errorText: "Minimum 3 characters required")
      ]),
    );
  }

  Widget _signUpTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Join With Us",
          style: TextStyle(fontSize: 22.sp),
        ),
      ],
    );
  }

  Widget _signUpLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/splash_logo.png",
          width: 100.w,
        )
      ],
    );
  }
}
