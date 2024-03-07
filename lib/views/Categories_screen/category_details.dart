import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/controller/product_controller.dart';
import 'package:flutter_ecommerce_app/views/Categories_screen/item_details.dart';
import 'package:provider/provider.dart';

class CategoriesDetails extends StatelessWidget {
  final String? title;

  const CategoriesDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    return Scaffold(
      backgroundColor: appColors,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            productController.resetValues();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColors,
          ),
        ),
        title: Text(
          title!,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: whiteColors),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                productController.subCat.length,
                (index) => GestureDetector(
                  onTap: () {
                    productController
                        .switchCategory("${productController.subCat[index]}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: whiteColors,
                          borderRadius: BorderRadius.circular(22)),
                      width: 120,
                      height: 60,
                      child: Center(
                        child: Text(
                          "${productController.subCat[index]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: blackColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: productController.productMethod,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Expanded(
                  child: Center(
                    child: loadingIndicator(),
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Expanded(
                    child: Center(child: Text("No products found!")));
              } else {
                var data = snapshot.data!.docs;

                return Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 250),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          productController.checkIfFav(data[index]);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ItemDetails(
                              title: "${data[index]['p_name']}",
                              data: data[index],
                            ),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: whiteColors,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    data[index]['p_imgs'],
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${data[index]['p_name']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: blackColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "₹ ${data[index]['p_price']}",
                                  style: TextStyle(
                                      color: appColors,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
