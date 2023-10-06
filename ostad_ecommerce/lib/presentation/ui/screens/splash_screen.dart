import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/presentation/ui/screens/home_screen.dart';
import '/presentation/ui/screens/auth/email_verification_screen.dart';
import '/presentation/ui/utility/image_assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => const HomeScreen()),
      //     (route) => false);
      Get.offAll(const HomeScreen());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              ImageAssetsPath.craftyBayLogoSVG,
              width: 130,
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 15,
          ),
          const Text("version 1.0.0"),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
