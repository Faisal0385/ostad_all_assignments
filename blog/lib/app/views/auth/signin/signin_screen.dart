import 'package:blog/app/constants/colors.dart';
import 'package:blog/app/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:blog/app/views/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _signinKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  void dispose() {
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
              _logo(),
              SizedBox(
                height: 20.w,
              ),
              _title(),
              SizedBox(
                height: 25.w,
              ),
              _emailField(),
              SizedBox(
                height: 15.w,
              ),
              _passwordField(),
              SizedBox(
                height: 15.w,
              ),
              _signInButton(),
              SizedBox(
                height: 15.w,
              ),
              _createForgotRow()
            ],
          ),
        ),
      ),
    );
  }

  Widget _createForgotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const SignUpScreen());
          },
          child: Text(
            "Create Account",
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const ForgotPasswordScreen());
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  Widget _signInButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Sign In",
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

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sign In With Us",
          style: TextStyle(fontSize: 22.sp),
        ),
      ],
    );
  }

  Widget _logo() {
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
