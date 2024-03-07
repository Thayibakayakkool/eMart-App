import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColors,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColors,
        title: const Text(
          'My Whislist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getWishlists(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Text('No wishlist  yet!');
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(
                          "${data[index]['p_imgs']}",
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          "${data[index]['p_name']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "${data[index]['p_price']}",
                          style: TextStyle(
                            color: appColors,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            await firestore
                                .collection(productCollection)
                                .doc(data[index].id)
                                .set({
                              'p_wishlist':
                                  FieldValue.arrayRemove([currentUser!.uid])
                            }, SetOptions(merge: true));
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
