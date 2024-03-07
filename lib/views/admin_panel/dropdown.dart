// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app/controller/sell_controller.dart';
// import 'package:provider/provider.dart';
//
// class DropDown extends StatelessWidget {
//   final String hint;
//   final List<String> list;
//
//   const DropDown({super.key, required this.hint, required this.list});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SellController>(
//       builder: (context, data, child) {
//         return DropdownButtonFormField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(22),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: tealColor, width: 2),
//               borderRadius: BorderRadius.circular(22),
//             ),
//             hintText: hint,
//           ),
//           items: list
//               .map((e) => DropdownMenuItem(
//                     value: e,
//                     child: Text(e),
//                   ))
//               .toList(),
//           onChanged: (value) {
//             if (hint == "Category") {
//               data.subcategoryvalue = '';
//               data.populateSubcategory(value.toString());
//               data.categoryvalue = value;
//             }
//             data.subcategoryvalue = value;
//           },
//         );
//       },
//     );
//   }
// }
