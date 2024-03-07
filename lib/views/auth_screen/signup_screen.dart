import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/textfield_signup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(color: appColors),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/emart.png'),
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Join the eMart',
                style: TextStyle(
                    fontSize: 18,
                    color: whiteColors,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidgetSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
