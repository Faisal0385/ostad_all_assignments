import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/presentation/ui/utility/image_assets_path.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
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
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email Address"
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
