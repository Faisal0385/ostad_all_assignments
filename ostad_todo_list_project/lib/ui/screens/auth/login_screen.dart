import 'package:flutter/material.dart';
import 'package:ostad_todo_list_project/data/models/auth_utility.dart';
import 'package:ostad_todo_list_project/data/models/login_model.dart';
import 'package:ostad_todo_list_project/data/models/network_response.dart';
import 'package:ostad_todo_list_project/data/services/network_caller.dart';
import 'package:ostad_todo_list_project/data/utils/urls.dart';
import 'package:ostad_todo_list_project/ui/screens/auth/signup_screen.dart';
import 'package:ostad_todo_list_project/ui/screens/bottom_nav_base_screen.dart';
import 'package:ostad_todo_list_project/ui/screens/auth/email_verification_screen.dart';
import 'package:ostad_todo_list_project/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    bool _loginInProgress = false;

    final TextEditingController _emailTEController = TextEditingController();
    final TextEditingController _passwordTEController = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Future<void> login() async{
      _loginInProgress = true;
      if (mounted) {
        setState(() {});
      }

      Map<String, dynamic> responseBody = {
        "email" : _emailTEController.text.trim(),
        "password":_passwordTEController.text
      };
      final NetworkResponse response = await NetworkCaller().postRequest(Urls.login, responseBody);

      _loginInProgress = false;
      if (mounted) {
        setState(() {});
      }

      if (response.isSuccess) {
        LoginModel model = LoginModel.fromJson(response.body!);
        await AuthUtility.saveUserInfo(model);
        if (mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavBaseScreen()),
                  (route) => false);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Incorrect email or password')));
        }
      }
    }

    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Get Started With",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length <= 5) {
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: _loginInProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          login();
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EmailVerificationScreen()));
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
