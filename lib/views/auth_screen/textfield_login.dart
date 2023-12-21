import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/controller/auth_controller.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/signup_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class TextFieldWidgetLogIn extends StatefulWidget {
  const TextFieldWidgetLogIn({super.key});

  @override
  State<TextFieldWidgetLogIn> createState() => _TextFieldWidgetLogInState();
}

class _TextFieldWidgetLogInState extends State<TextFieldWidgetLogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  Utils utils = Utils();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController=Provider.of<AuthController>(context);
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                labelStyle: TextStyle(fontSize: 17, color: appColors),
                hintText: 'E-Mail',
                hintStyle: TextStyle(fontSize: 18, color: appColors),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal, width: 2),
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
              controller: passwordController,
              obscureText: isObscureText,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 17, color: appColors),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 18, color: appColors),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
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
          TextButton(
              onPressed: () {},
              child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot password?'))),
          SizedBox(
            width: 350,
            child: isLoading
                ? const CircularProgressIndicator(
                    color: whiteColors,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      isLoading = true;
                      await authController
                          .loginMethod(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        if (value != null) {
                          utils.showSnackBars(
                              context: context, content: loggedIn);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BottomNavigationBars(),
                          ));
                        } else {
                          isLoading = false;
                        }
                      });
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(appColors),
                    ),
                  ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Create a new Account',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ));
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal[600]),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Log in with',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: 40, child: facebookIcons),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: 40, child: googleIcons),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: 40, child: twitterIcons),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
