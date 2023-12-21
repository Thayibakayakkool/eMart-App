import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/controller/auth_controller.dart';
import 'package:flutter_ecommerce_app/controller/cart_controller.dart';
import 'package:flutter_ecommerce_app/controller/home_controller.dart';
import 'package:flutter_ecommerce_app/controller/product_controller.dart';
import 'package:flutter_ecommerce_app/controller/profile_controller.dart';
import 'package:flutter_ecommerce_app/controller/sell_controller.dart';
import 'package:flutter_ecommerce_app/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA2M-JWyjRzeVJraVHBMH_hiw63LvsP4-0",
            authDomain: "login-firebase-21e71.firebaseapp.com",
            projectId: "login-firebase-21e71",
            storageBucket: "login-firebase-21e71.appspot.com",
            messagingSenderId: "795812657084",
            appId: "1:795812657084:web:fae220b6d8a6109dd69db9",
            measurementId: "G-2ZSLX7WHJC"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider<ProfileController>(
          create: (context) => ProfileController(),
        ),
        ChangeNotifierProvider<ProductController>(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider<CartController>(
          create: (context) => CartController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider<SellController>(
          create: (context) => SellController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: appColors, elevation: 0)),
        home: const SplashScreen(),
      ),
    );
  }
}
