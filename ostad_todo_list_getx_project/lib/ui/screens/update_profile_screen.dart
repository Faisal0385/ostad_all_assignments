import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/data/models/auth_utility.dart';
import '/data/models/login_model.dart';
import '/data/models/network_response.dart';
import '/data/services/network_caller.dart';
import '/data/utils/urls.dart';
import '/ui/widgets/screen_background.dart';
import '/ui/widgets/user_profile_banner.dart';
import 'dart:io';
import 'dart:async';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  UserData userData = AuthUtility.userInfo.data!;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _profileInProgress = false;

  File? imagePath;
  String? imageData;

  XFile? imageFile;
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _emailTEController.text = userData.email ?? '';
    _firstNameTEController.text = userData.firstName ?? '';
    _lastNameTEController.text = userData.lastName ?? '';
    _mobileTEController.text = userData.mobile ?? '';
  }

  void selectImage() {
    picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = xFile;
        imagePath = File(imageFile!.path);
        imageData = base64Encode(imagePath!.readAsBytesSync());
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  Future<void> updateProfile() async {
    _profileInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final Map<String, dynamic> requestBody = {
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "photo": imageData,
    };
    if (_passwordTEController.text.isNotEmpty) {
      requestBody['password'] = _passwordTEController.text;
    }

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.updateProfile, requestBody);
    _profileInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      userData.firstName = _firstNameTEController.text.trim();
      userData.lastName = _lastNameTEController.text.trim();
      userData.mobile = _mobileTEController.text.trim();
      AuthUtility.updateUserInfo(userData);
      _passwordTEController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Profile updated!')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile update failed! Try again.')));
      }
    }
  }

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
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: imageFile != null
                            ? Image.file(imagePath!)
                            : const Icon(Icons.image, size: 50,),
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              readOnly: true,
                              keyboardType: TextInputType.emailAddress,
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
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: _profileInProgress
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        updateProfile();
                                      },
                                      child: const Text('Update'),
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
}
