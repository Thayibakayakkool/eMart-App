import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';

Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title1",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "$d1",
              style: TextStyle(color: appColors, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title2",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("$d2")
            ],
          ),
        )
      ],
    ),
  );
}
