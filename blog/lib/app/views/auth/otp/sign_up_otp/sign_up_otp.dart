import 'package:blog/app/constants/colors.dart';
import 'package:blog/app/views/dashboard/user_dashboard/user_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SignUpOTPScreen extends StatefulWidget {
  const SignUpOTPScreen({Key? key}) : super(key: key);

  @override
  State<SignUpOTPScreen> createState() => _SignUpOTPScreenState();
}

class _SignUpOTPScreenState extends State<SignUpOTPScreen> {

  final _nameController = TextEditingController();
  final _otpKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool checkingSubmit = false;

  @override
  void dispose() {
    super.dispose();
  }

  handleSubmit() {
    if (!checkingSubmit) {
      checkingSubmit = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 1)).then((value) {
        checkingSubmit = false;
        setState(() {});
        Get.offAll(() => const UserDashboardScreen());
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
            key: _otpKey,
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
                _otpText(),
                SizedBox(
                  height: 25.w,
                ),
                _otpField(),
                SizedBox(
                  height: 15.w,
                ),
                _verifyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _verifyButton() {
    return ElevatedButton(
      onPressed: () {
        if (_otpKey.currentState!.validate()) {
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
        "Verify",
        style: TextStyle(
          fontSize: 15.sp,
        ),
      ),
    );
  }

  Widget _otpField() {
    return TextFormField(
      // controller: _passwordController,
      style: TextStyle(fontSize: 14.sp),
      // obscureText: hidePassword,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor, width: 2),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: kBaseColor),
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.w),
          label: const Text("OTP Numbers"),
         ),
      validator: RequiredValidator(errorText: "OTP is required"),
    );
  }

  Widget _otpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "Enter your 6 digits OTP code sent to your email",
            style: TextStyle(fontSize: 13.sp),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "OTP Number",
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
