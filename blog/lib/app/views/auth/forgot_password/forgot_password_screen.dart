import 'package:blog/app/constants/colors.dart';
import 'package:blog/app/views/auth/otp/forget_otp/forgot_otp_screen.dart';
import 'package:blog/app/views/auth/signin/signin_screen.dart';
import 'package:blog/app/views/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _emailController = TextEditingController();
  final _forgetKey = GlobalKey<FormState>();
  bool sendingOtp = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  sendOtp() {
    if (!sendingOtp) {
      sendingOtp = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 1)).then((value) {
        sendingOtp = false;
        setState(() {});
        Get.to(() => const ForgotOTPScreen());
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
            key: _forgetKey,
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
                _forgotText(),
                SizedBox(
                  height: 25.w,
                ),
                _emailField(),
                SizedBox(
                  height: 15.w,
                ),
                _getOtpButton(),
                SizedBox(
                  height: 15.w,
                ),
                _backToSignIn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _backToSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        GestureDetector(
          onTap: () {
            Get.to(() => const SignInScreen());
          },
          child: Text(
            "Back To Sign In Page",
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  Widget _getOtpButton() {
    return ElevatedButton(
      onPressed: () {
        if (_forgetKey.currentState!.validate()) {
          sendOtp();
        }
      },
      child: sendingOtp
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
        "Get OTP",
        style: TextStyle(
          fontSize: 13.sp,
        ),
      ),
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

  Widget _forgotText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "Enter your email we'll send you a 6 digits OTP code.",
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
          "Forgot Password?",
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
