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

  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
        }else{
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavigationBars(),));
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    'https://imgs.search.brave.com/eU_OXjqbkkO3AVdAUwqYnvrXm5aYzU1lxdNZVTf_a1Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/ODY0NDU3MC92ZWN0/b3Ivc2hvcHBpbmct/Y2FydC1pY29uLWRl/c2lnbi1jYXJ0LWlj/b24tc3ltYm9sLWRl/c2lnbi5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9X2xUR2tT/a0o2aGE4Wk5pS0Q4/WFdWdExOeVRqUTc0/SEN1X2M0V0ZpbzI3/Zz0',
                  )),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'eMart',
                style: TextStyle(
                    color: whiteColors,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
