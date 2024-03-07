// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app/constant/constant.dart';
// import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
// import 'package:flutter_ecommerce_app/constant/utils.dart';
// import 'package:flutter_ecommerce_app/controller/sell_controller.dart';
// import 'package:flutter_ecommerce_app/services/firestore_services.dart';
// import 'package:flutter_ecommerce_app/views/Categories_screen/item_details.dart';
// import 'package:flutter_ecommerce_app/views/admin_panel/sell_screen.dart';
// import 'package:provider/provider.dart';
//
// class AdminScreen extends StatelessWidget {
//   const AdminScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final sellController = Provider.of<SellController>(context);
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: appColors,
//         foregroundColor: whiteColors,
//         onPressed: () async {
//           await sellController.getCategories();
//           sellController.populateCategoryList();
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => const SellScreen(),
//           ));
//         },
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         backgroundColor: whiteColors,
//         automaticallyImplyLeading: false,
//         title: const Text(
//           'Products',
//           style: TextStyle(
//             color: blackColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: StreamBuilder(
//         stream: FirestoreServices.getProduct(currentUser!.uid),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: loadingIndicator(),
//             );
//           } else {
//             var data = snapshot.data!.docs;
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: List.generate(
//                     data.length,
//                     (index) {
//                       return Card(
//                         child: ListTile(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ItemDetails(
//                                     title: "${data[index]['p_name']}",
//                                     data: data[index],
//                                   ),
//                                 ));
//                           },
//                           trailing: PopupMenuButton(
//                             itemBuilder: (context) => [
//                               PopupMenuItem(
//                                 onTap: () {
//                                   if (data[index]['is_featured'] == true) {
//                                     sellController
//                                         .removeFeatured(data[index].id);
//                                     Utils().showSnackBars(
//                                         context: context,
//                                         content: "Removed Featured");
//                                   } else {
//                                     sellController.addFeatured(data[index].id);
//                                     Utils().showSnackBars(
//                                         context: context,
//                                         content: "Added Featured");
//                                   }
//                                 },
//                                 child: const Text('Featured'),
//                               ),
//                               PopupMenuItem(
//                                   onTap: () {
//                                     sellController
//                                         .removedProduct(data[index].id);
//                                     Utils().showSnackBars(
//                                         context: context,
//                                         content: "Removed Product");
//                                   },
//                                   child: const Text('Delete')),
//                             ],
//                           ),
//                           leading: Image.network(
//                             data[index]['p_imgs'],
//                             width: 100,
//                             height: 100,
//                           ),
//                           title: Text("${data[index]['p_name']}"),
//                           subtitle: Row(
//                             children: [
//                               Text("₹${data[index]['p_price']}"),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 data[index]['is_featured'] == true
//                                     ? "Featured"
//                                     : '',
//                                 style: TextStyle(color: appColors),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
