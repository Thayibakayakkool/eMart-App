import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/controller/auth_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors,
        appBar: AppBar(
          backgroundColor: transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: whiteColors,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Reset Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: whiteColors,
                    fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Enter your email and we will send you a password reset link',
                style: TextStyle(color: whiteColors, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(color: whiteColors),
                controller: authController.emailController,
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  labelStyle: const TextStyle(fontSize: 17, color: whiteColors),
                  hintText: 'E-Mail',
                  hintStyle: const TextStyle(fontSize: 18, color: whiteColors),
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
            MaterialButton(
              onPressed: () {
                authController.passwordReset(context);
              },
              color: Colors.white,
              child: Text(
                'Reset Password',
                style: TextStyle(
                    color: appColors, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
