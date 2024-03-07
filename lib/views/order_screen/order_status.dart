import 'package:flutter/material.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Container(
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    ),
    trailing: SizedBox(
      height: 100,
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title'),
          showDone
              ? const Icon(
                  Icons.done,
                  color: Colors.green,
                )
              : Container(),
        ],
      ),
    ),
  );
}
