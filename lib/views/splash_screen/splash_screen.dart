import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BottomNavigationBars(),
          ));
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors,
      body: const SafeArea(
        child: Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/emart.png'),
            radius: 80,
          ),
        ),
      ),
    );
  }
}
