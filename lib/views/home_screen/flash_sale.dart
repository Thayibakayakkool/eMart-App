import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 220),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        flashCategory[index],
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        flashCategoryName[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹ ${flashCategoryRate[index]}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: appColors),
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
