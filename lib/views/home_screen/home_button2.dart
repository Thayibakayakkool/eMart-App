import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/views/Categories_screen/categories_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/brand_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/top_seller_screen.dart';

class HomeButton2 extends StatelessWidget {
  const HomeButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoriesScreen(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: whiteColors,
            ),
            width: 120,
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        'https://cdn3.iconfinder.com/data/icons/e-commerce-756/24/categories_ui_apps_menu_options_add_interface-128.png')),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Top Categories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BrandScreen(),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: whiteColors,
            ),
            width: 120,
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        'https://cdn0.iconfinder.com/data/icons/complete-version-1/1024/bulb4-128.png')),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Brand',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TopSellerScreen(),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: whiteColors,
            ),
            width: 120,
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        'https://cdn4.iconfinder.com/data/icons/eon-ecommerce-i-1/32/top_king_crown_seller-128.png')),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Top Sellers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
