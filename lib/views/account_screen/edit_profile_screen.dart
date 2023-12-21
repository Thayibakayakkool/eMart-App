import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/controller/profile_controller.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final profileController = Provider.of<ProfileController>(context);
    nameController.text = data['name'];
    passwordController.text = data['password'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: appColors,
      ),
      body: Container(
        color: appColors,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: whiteColors,
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 50, right: 12, left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                data['imageUrl'] == '' &&
                        profileController.profileImagePath.isEmpty
                    ? const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://as2.ftcdn.net/v2/jpg/03/38/17/69/1000_F_338176982_maA8pB6ZEZyyTz1SYSRwYoFRdgH0gu8J.jpg'),
                    )
                    : data['imageUrl'] != '' &&
                            profileController.profileImagePath.isEmpty
                        ? CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(data['imageUrl']),
                        )
                        : CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(
                              File(profileController.profileImagePath)),
                        ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    profileController.changeImage(context);
                  },
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appColors),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 17, color: appColors),
                      hintText: 'Name',
                      hintStyle: TextStyle(fontSize: 18, color: appColors),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 17, color: appColors),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 18, color: appColors),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                profileController.isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(appColors),
                      )
                    : SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () async {
                            profileController.isLoading = true;
                            await profileController.uploadProfileImage();
                            await profileController.updateProfile(
                                imageUrl: profileController.profileImageLink,
                                name: nameController.text,
                                password: passwordController.text);
                            Utils().showSnackBars(
                                context: context, content: "Updated");
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(appColors),
                          ),
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
