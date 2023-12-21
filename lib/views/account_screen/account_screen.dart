import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/controller/auth_controller.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';
import 'package:flutter_ecommerce_app/views/account_screen/details_card.dart';
import 'package:flutter_ecommerce_app/views/account_screen/edit_profile_screen.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:flutter_ecommerce_app/views/order_screen/order_screen.dart';
import 'package:flutter_ecommerce_app/views/wishlist_screen/wishlist_screen.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController=Provider.of<AuthController>(context);

    return Scaffold(
        backgroundColor: appColors,
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(appColors),
              ));
            } else {
              var data = snapshot.data!.docs[0];
              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(
                                    data: data,
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: whiteColors,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          data['imageUrl'] == ''
                              ? const CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    'https://as2.ftcdn.net/v2/jpg/03/38/17/69/1000_F_338176982_maA8pB6ZEZyyTz1SYSRwYoFRdgH0gu8J.jpg'),
                              )
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(data['imageUrl'])),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data['name']}",
                                  style: const TextStyle(
                                      color: whiteColors,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "${data['email']}",
                                  style: const TextStyle(
                                      color: whiteColors, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: whiteColors)),
                            onPressed: () async {
                              await authController.signoutMethod();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                            },
                            child: const Text(
                              "Log out",
                              style: TextStyle(
                                  color: whiteColors,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: FirestoreServices.getCounts(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: loadingIndicator(),
                            );
                          } else {
                            var countData = snapshot.data;

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DetailsCard(
                                  count: countData[0].toString(),
                                  title: "in your cart",
                                ),
                                DetailsCard(
                                  count: countData[1].toString(),
                                  title: "in your wishlist",
                                ),
                                DetailsCard(
                                  count: countData[2].toString(),
                                  title: "your orders",
                                )
                              ],
                            );
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: whiteColors,
                            borderRadius: BorderRadius.circular(12)),
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => const WishlistScreen(),
                                      ));
                                      break;
                                    case 1:
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => const OrderScreen(),
                                      ));
                                      break;
                                  }
                                },
                                leading: Image.network(
                                  profileButtonImage[index],
                                  width: 22,
                                ),
                                title: Text(profileButtonName[index]),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.grey,
                              );
                            },
                            itemCount: profileButtonName.length),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
