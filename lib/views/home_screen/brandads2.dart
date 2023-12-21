import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

class BrandAdWidget2 extends StatefulWidget {
  const BrandAdWidget2({super.key});

  @override
  State<BrandAdWidget2> createState() => _BrandAdWidget2State();
}

class _BrandAdWidget2State extends State<BrandAdWidget2> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragEnd: (_) {
          if (currentIndex == (brandsList2.length - 1)) {
            currentIndex = -1;
          }
          setState(() {
            currentIndex++;
          });
        },
        child: Stack(children: [
          Image.network(
            brandsList2[currentIndex],
            width: double.infinity,
          )
        ]));
  }
}
