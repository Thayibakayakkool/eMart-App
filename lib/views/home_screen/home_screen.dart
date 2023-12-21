import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/controller/home_controller.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';
import 'package:flutter_ecommerce_app/views/Categories_screen/item_details.dart';
import 'package:flutter_ecommerce_app/views/home_screen/search_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/brandads2.dart';
import 'package:flutter_ecommerce_app/views/home_screen/brandads3.dart';
import 'package:flutter_ecommerce_app/views/home_screen/brandads.dart';
import 'package:flutter_ecommerce_app/views/home_screen/home_button.dart';
import 'package:flutter_ecommerce_app/views/home_screen/home_button2.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey[200],
      width: screenSize.width,
      height: screenSize.height,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: Colors.grey[200],
            child: TextFormField(
              controller: homeController.searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    if (homeController.searchController.text.isNotEmpty) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          title: homeController.searchController.text,
                        ),
                      ));
                    }
                  },
                  icon: const Icon(Icons.search),
                  color: appColors,
                ),
                filled: true,
                fillColor: whiteColors,
                hintText: 'Search something...',
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BrandAdWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  const HomeButton(),
                  const SizedBox(
                    height: 8,
                  ),
                  const BrandAdWidget2(),
                  const SizedBox(
                    height: 8,
                  ),
                  const HomeButton2(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(color: appColors),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Featured Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: whiteColors,
                              fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
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
                                                  fit: BoxFit.cover,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
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
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
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
                  const SizedBox(
                    height: 8,
                  ),
                  const BrandAdWidget3(),
                  const SizedBox(
                    height: 8,
                  ),
                  StreamBuilder(
                    stream: FirestoreServices.allProducts(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: loadingIndicator(),
                        );
                      } else {
                        var allProductsdata = snapshot.data!.docs;
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: allProductsdata.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 280),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ItemDetails(
                                    title:
                                        "${allProductsdata[index]['p_name']}",
                                    data: allProductsdata[index],
                                  ),
                                ));
                              },
                              child: Container(
                                color: whiteColors,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      allProductsdata[index]['p_imgs'],
                                      width: 200,
                                      height: 200,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${allProductsdata[index]['p_name']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "₹ ${allProductsdata[index]['p_price']}",
                                      style: TextStyle(
                                          color: appColors,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
