import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/controller/auth_controller.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class TextFieldWidgetSignUp extends StatefulWidget {
  const TextFieldWidgetSignUp({super.key});

  @override
  State<TextFieldWidgetSignUp> createState() => _TextFieldWidgetSignUpState();
}

class _TextFieldWidgetSignUpState extends State<TextFieldWidgetSignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscureText = true;
  bool? isCheck = false;
  Utils utils = Utils();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return Container(
      width: 380,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: whiteColors),
      child: Column(
        children: [
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
                  borderSide: const BorderSide(color: tealColor, width: 2),
                  borderRadius: BorderRadius.circular(22),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: blackColor),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                labelStyle: TextStyle(fontSize: 17, color: appColors),
                hintText: 'E-Mail',
                hintStyle: TextStyle(fontSize: 18, color: appColors),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: tealColor, width: 2),
                  borderRadius: BorderRadius.circular(22),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: blackColor),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: isObscureText,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 17, color: appColors),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 18, color: appColors),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: tealColor, width: 2),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: blackColor),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      icon: isObscureText
                          ? Icon(
                              Icons.visibility_outlined,
                              color: appColors,
                            )
                          : Icon(
                              Icons.visibility_off_outlined,
                              color: appColors,
                            ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: confirmPasswordController,
              obscureText: isObscureText,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(fontSize: 17, color: appColors),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(fontSize: 18, color: appColors),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: tealColor, width: 2),
                  borderRadius: BorderRadius.circular(22),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: blackColor),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: whiteColors,
                  activeColor: appColors,
                  value: isCheck,
                  onChanged: (newValue) {
                    setState(() {
                      isCheck = newValue;
                    });
                  }),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "I agree to the ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: grey600,
                      )),
                  TextSpan(
                      text: "Terms and Conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors,
                      )),
                  TextSpan(
                      text: " & ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: grey600,
                      )),
                  TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors,
                      )),
                ])),
              )
            ],
          ),
          SizedBox(
            width: 350,
            child: isLoading
                ? const CircularProgressIndicator(
                    color: whiteColors,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      if (isCheck != false) {
                        isLoading = true;
                        try {
                          await authController
                              .signupMethod(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            return authController.storeUserData(
                                nameController.text,
                                passwordController.text,
                                emailController.text);
                          }).then((value) {
                            utils.showSnackBars(
                                context: context, content: loggedIn);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBars(),
                            ));
                          });
                        } catch (e) {
                          authController.signoutMethod();
                          utils.showSnackBars(
                              context: context, content: loggedout);
                          isLoading = false;
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          isCheck == true ? appColors : Colors.grey),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, color: whiteColors),
                    ),
                  ),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            },
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Already have an Account? ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: grey600,
                  )),
              TextSpan(
                  text: "Log in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: appColors,
                  )),
            ])),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
