import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

class BrandAdWidget3 extends StatefulWidget {
  const BrandAdWidget3({super.key});

  @override
  State<BrandAdWidget3> createState() => _BrandAdWidget2State();
}

class _BrandAdWidget2State extends State<BrandAdWidget3> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentIndex == (brandsList3.length - 1)) {
          currentIndex = -1;
        }
        setState(() {
          currentIndex++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            brandsList3[currentIndex],
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
