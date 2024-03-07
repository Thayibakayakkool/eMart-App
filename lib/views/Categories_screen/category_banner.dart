import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

class CategoryBanner extends StatefulWidget {
  const CategoryBanner({super.key});

  @override
  State<CategoryBanner> createState() => _BrandAdWidget2State();
}

class _BrandAdWidget2State extends State<CategoryBanner> {
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
