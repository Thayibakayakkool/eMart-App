import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/controller/cart_controller.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';
import 'package:flutter_ecommerce_app/views/cart_screen/shipping_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ShippingDetails(),
                  ));
                },
                child: const Text(
                  "Proceed to shopping",
                  style: TextStyle(color: whiteColors),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(appColors)),
              )),
          appBar: AppBar(
            backgroundColor: whiteColors,
            automaticallyImplyLeading: false,
            title: const Text(
              'Shopping cart',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          body: StreamBuilder(
            stream: FirestoreServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('Cart is empty'),
                );
              } else {
                var data = snapshot.data!.docs;
                cartController.calculate(data);
                cartController.productSnapshot = data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.network(
                                "${data[index]['img']}",
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                "${data[index]['title']} (x${data[index]['qty']})",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Text(
                                "₹ ${data[index]['tprice']}",
                                style: TextStyle(
                                    color: appColors,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  FirestoreServices.deleteDocuments(
                                      data[index].id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        color: Colors.amber[200],
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total price",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "₹ ${cartController.totalP}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: appColors),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
