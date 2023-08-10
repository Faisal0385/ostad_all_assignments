import 'package:blog/app/constants/colors.dart';
import 'package:blog/app/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:blog/app/views/auth/signin/signin_screen.dart';
import 'package:blog/app/views/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _confirmpasswordController = TextEditingController();
  final _newpasswordController = TextEditingController();

  final _resetPasswordKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool checkingSubmit = false;

  @override
  void dispose() {
    _confirmpasswordController.dispose();
    _newpasswordController.dispose();
    super.dispose();
  }

  handleSubmit() {
    if (!checkingSubmit) {
      checkingSubmit = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 1)).then((value) {
        checkingSubmit = false;
        setState(() {});
        Get.to(() => const SignInScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
          child: Form(
            key: _resetPasswordKey,
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
                _passwordField(),
                SizedBox(
                  height: 15.w,
                ),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_resetPasswordKey.currentState!.validate()) {
          handleSubmit();
        }
      },
      child: checkingSubmit
          ? SizedBox(
          height: 30.w,
          width: 30.w,
          child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: const [Color(0xFFffffff)],
            strokeWidth: 5.w,
          )
      )
          : Text(
        "Submit",
        style: TextStyle(
          fontSize: 15.sp,
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _newpasswordController,
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
          label: const Text("New Password"),
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

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Reset Your Password",
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
