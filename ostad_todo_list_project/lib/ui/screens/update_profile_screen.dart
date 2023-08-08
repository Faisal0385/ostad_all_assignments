import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ostad_todo_list_project/ui/widgets/screen_background.dart';
import 'package:ostad_todo_list_project/ui/widgets/user_profile_banner.dart';
import 'dart:io';
import 'dart:async';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile? imageFile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserProfileBanner(isUpdateScreen: true),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Update Profile",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                selectImage();
                              },
                              child: Container(
                                width: double.infinity,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(14),
                                      color: Colors.grey,
                                      child: const Text(
                                        'Photos',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Visibility(
                                      visible: imageFile != null,
                                      child: Text(imageFile?.name ?? ''),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: _firstNameTEController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "First Name",
                              ),
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter your first name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: _lastNameTEController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Last Name",
                              ),
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter your last name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: _mobileTEController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Mobile",
                              ),
                              validator: (String? value) {
                                if ((value?.isEmpty ?? true) ||
                                    value!.length < 11) {
                                  return 'Enter your valid mobile no';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: _emailTEController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
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
                              decoration: InputDecoration(
                                hintText: "Password",
                              ),
                              validator: (String? value) {
                                if ((value?.isEmpty ?? true) ||
                                    value!.length <= 5) {
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
                              child: ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                },
                                child: const Icon(
                                    Icons.arrow_circle_right_outlined),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectImage() {
    picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = xFile;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }
}
