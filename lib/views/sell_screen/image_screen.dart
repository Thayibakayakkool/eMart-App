import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controller/sell_controller.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellController>(builder: (context, value, child) {
      return Stack(
        children: [
          value.image == null
              ? Image.network(
                  "https://imgs.search.brave.com/kasDk2pqUCMn5hnrt-nmsKrEevkm8VmREjhc2Kvgzyo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAzLzQ2LzgzLzk2/LzM2MF9GXzM0Njgz/OTY4M182bkFQemJo/cFNrSXBiOHBtQXd1/ZmtDN2M1ZUQ3d1l3/cy5qcGc",
                  height: 100,
                )
              : Image.memory(
                  value.image!,
                  height: 100,
                ),
          IconButton(
              onPressed: () async {
                Uint8List? temp = await value.pickImage();
                if (temp != null) {
                  value.image = temp;
                }
              },
              icon: const Icon(Icons.file_upload))
        ],
      );
    });
  }
}
