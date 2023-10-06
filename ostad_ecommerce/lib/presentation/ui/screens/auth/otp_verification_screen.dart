import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:ostad_ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:ostad_ecommerce/presentation/ui/utility/image_assets_path.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpTEController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      ImageAssetsPath.craftyBayLogoSVG,
                      width: 130,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Enter Your OTP Code",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Pls Enter Your 4 digits OTP Code",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PinCodeTextField(
                    controller: _otpTEController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: Colors.green,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // verifyEmail(controller);
                          Get.to(const CompleteProfileScreen());
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(text: 'This code will expire in '),
                        TextSpan(
                          text: '120s',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.grey),
                    child: const Text('Resend Code'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
