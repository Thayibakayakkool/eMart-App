import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/controller/product_controller.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';
import 'package:flutter_ecommerce_app/views/Categories_screen/rating_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({super.key, required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    return WillPopScope(
      onWillPop: () async {
        productController.resetValues();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                productController.resetValues();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: Text(title!),
            actions: [
              IconButton(
                  onPressed: () {
                    Share.share(
                        "${data['p_imgs']},\n$title!,₹ ${data['p_price']}");
                  },
                  icon: const Icon(Icons.share)),
              IconButton(
                  onPressed: () {
                    if (productController.isFav) {
                      productController.removeFromWishlist(data.id, context);
                    } else {
                      productController.addToWishlist(data.id, context);
                    }
                  },
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: productController.isFav ? Colors.red : whiteColors,
                  )),
            ],
          ),
          body: Column(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        data['p_imgs'],
                        width: 300,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RatingScreens(rating: data['p_rating']),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹ ${data['p_price']}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: appColors),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Seller",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: whiteColors),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("${data['p_seller']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          color: whiteColors,
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Color: ",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                      data['p_colors'].length,
                                      (index) => Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(horizontal: 4),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    productController
                                                        .changeColorIndex(
                                                            index);
                                                  },
                                                  child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: CircleAvatar(
                                                      backgroundColor: Color(
                                                          data['p_colors']
                                                              [index]),
                                                      child: Visibility(
                                                          visible: index ==
                                                              productController
                                                                  .colorIndex,
                                                          child: const Icon(
                                                            Icons.done,
                                                            color:
                                                                whiteColors,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                )
                              ],
                            ),
                          ])),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: whiteColors,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Quantity: ",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                                Row(children: [
                                  IconButton(
                                      onPressed: () {
                                        productController.decreaseQuantity();
                                        productController.calculateTotalPrice(
                                            double.parse(data['p_price']));
                                      },
                                      icon: const Icon(Icons.remove)),
                                  Text(
                                    "${productController.quantity}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        productController.increaseQuantity(
                                            double.parse(data['p_quantity']));
                                        productController.calculateTotalPrice(
                                            double.parse(data['p_price']));
                                      },
                                      icon: const Icon(Icons.add)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("(${data['p_quantity']} available)",
                                      style:
                                          const TextStyle(color: Colors.grey))
                                ])
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        color: whiteColors,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Total: ",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                                Text(
                                  "₹ ${productController.totalPrice}",
                                  style: TextStyle(
                                      color: appColors,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${data['p_desc']}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Products you may also like',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder(
                              future: FirestoreServices.getFeaturedProducts(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: loadingIndicator(),
                                  );
                                } else if (snapshot.data!.docs.isEmpty) {
                                  return const Center(
                                      child: Text('No featured products'));
                                } else {
                                  var featuredData = snapshot.data!.docs;

                                  return Row(
                                      children: List.generate(
                                    featuredData.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ItemDetails(
                                            title:
                                                "${featuredData[index]['p_name']}",
                                            data: featuredData[index],
                                          ),
                                        ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          color: whiteColors,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                featuredData[index]['p_imgs'],
                                                width: 150,
                                                height: 150,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Text(
                                                  "${featuredData[index]['p_name']}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Text(
                                                  "₹ ${featuredData[index]['p_price']}",
                                                  style: TextStyle(
                                                      color: appColors,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                                }
                              }))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (productController.quantity > 0) {
                    productController.addToCart(
                        color: data['p_colors'][productController.colorIndex],
                        context: context,
                        vendorId: data['vendor_id'],
                        img: data['p_imgs'],
                        qty: productController.quantity,
                        sellername: data['p_seller'],
                        title: data['p_name'],
                        tprice: productController.totalPrice);
                    Utils().showSnackBars(
                        context: context, content: "Added to Cart");
                  } else {
                    Utils().showSnackBars(
                        context: context,
                        content: "Minimum 1 product is required");
                  }
                },
                child: const Text('Add to cart'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appColors)),
              ),
            )
          ])),
    );
  }
}
