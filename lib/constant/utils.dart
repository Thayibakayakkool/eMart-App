import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

class Utils {
  showSnackBars({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: whiteColors,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              content,
              style: TextStyle(color: appColors),
            )
          ],
        ),
      ),
    );
  }
}
