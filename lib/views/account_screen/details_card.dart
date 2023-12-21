import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

class DetailsCard extends StatelessWidget {
  final String? title;
  final String? count;

  const DetailsCard({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: whiteColors),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                count!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(title!)
            ],
          ),
        ));
  }
}
