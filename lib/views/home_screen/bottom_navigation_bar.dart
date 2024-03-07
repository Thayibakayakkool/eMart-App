import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/views/Categories_screen/categories_screen.dart';
import 'package:flutter_ecommerce_app/views/account_screen/account_screen.dart';
import 'package:flutter_ecommerce_app/views/cart_screen/cart_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/home_screen.dart';
// import 'package:flutter_ecommerce_app/views/admin_panel/admin_screen.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({super.key});

  @override
  State<BottomNavigationBars> createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final navbarItems = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: appColors,
            size: 30,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            color: appColors,
            size: 30,
          ),
          label: "Categories"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: appColors,
            size: 30,
          ),
          label: "Cart"),
      // BottomNavigationBarItem(
      //     icon: Icon(
      //       Icons.sell,
      //       color: appColors,
      //       size: 30,
      //     ),
      //     label: "Admin Panel"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: appColors,
            size: 30,
          ),
          label: "Account")
    ];

    var navBody = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      // const AdminScreen(),
      const AccountScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: appColors,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: tealColor,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColors,
        items: navbarItems,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: Container(
        child: navBody.elementAt(currentIndex),
      ),
    );
  }
}
