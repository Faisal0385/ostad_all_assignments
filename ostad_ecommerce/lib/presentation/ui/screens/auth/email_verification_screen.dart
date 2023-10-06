import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/presentation/ui/screens/auth/otp_verification_screen.dart';
import '/presentation/ui/utility/image_assets_path.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  "Welcome Back",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Pls Enter Your Email Address",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email Address"
                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter your email address';
                    } else if (text!.isEmail == false) {
                      /// REGEX (Email validator)
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
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
                        Get.to(const OTPVerification());
                      }
                    },
                    child: const Text("Next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
