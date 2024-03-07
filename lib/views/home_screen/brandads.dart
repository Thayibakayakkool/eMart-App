import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

class BrandAdWidget extends StatefulWidget {
  const BrandAdWidget({super.key});

  @override
  State<BrandAdWidget> createState() => _BrandAdWidgetState();
}

class _BrandAdWidgetState extends State<BrandAdWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentIndex == (brandsList.length - 1)) {
          currentIndex = -1;
        }
        setState(() {
          currentIndex++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            brandsList[currentIndex],
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
