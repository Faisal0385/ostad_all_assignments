import 'package:flutter/material.dart';
import 'package:ostad_todo_list_getx_project/ui/screens/auth/login_screen.dart';
import '/ui/state_managers/signup_controller.dart';
import '/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    height: 100,
                  ),
                  Text(
                    "Join With Us",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("First Name"),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Last Name"),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _mobileTEController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      label: Text("Mobile"),
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length < 11) {
                        return 'Enter your valid mobile no';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length <= 5) {
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<SignUpController>(
                    builder: (signUpController){
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: signUpController.signUpInProgress == false,
                          replacement:
                          const Center(child: CircularProgressIndicator()),
                          child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              signUpController.userSignUp(
                                _emailTEController.text.trim(),
                                _firstNameTEController.text.trim(),
                                _lastNameTEController.text.trim(),
                                _passwordTEController.text,
                                _mobileTEController.text.trim(),
                              ).then((result){

                                if(result == true){
                                  _emailTEController.clear();
                                  _passwordTEController.clear();
                                  _firstNameTEController.clear();
                                  _lastNameTEController.clear();
                                  _mobileTEController.clear();
                                  Get.snackbar('Success', 'Registration Successful!');
                                }else{
                                  Get.snackbar('Failed', 'Registration Failed!');
                                }

                              });
                            },
                            child: const Icon(Icons.arrow_circle_right_outlined),
                          ),
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text("Sign In"),
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
