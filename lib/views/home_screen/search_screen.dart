import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';
import 'package:flutter_ecommerce_app/views/Categories_screen/item_details.dart';

class SearchScreen extends StatelessWidget {
  final String? title;

  const SearchScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColors,
          title: Text(
            title!,
            style: const TextStyle(color: blackColor),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: blackColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: FirestoreServices.searchProducts(title),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Text(
                  'No products found',
                  style: TextStyle(color: Colors.white),
                );
              } else {
                var data = snapshot.data!.docs;
                var filtered = data
                    .where((element) => element['p_name']
                        .toString()
                        .toLowerCase()
                        .contains(title!.toLowerCase()))
                    .toList();

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 270),
                    children: List.generate(
                      filtered.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ItemDetails(
                                title: "${filtered[index]['p_name']}",
                                data: filtered[index],
                              ),
                            ));
                          },
                          child: Container(
                            color: Colors.grey[200],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  filtered[index]['p_imgs'],
                                  width: 200,
                                  height: 200,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${filtered[index]['p_name']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${filtered[index]['p_price']}",
                                  style: TextStyle(
                                      color: appColors,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
