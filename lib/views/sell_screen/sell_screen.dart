import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/controller/sell_controller.dart';
import 'package:flutter_ecommerce_app/views/sell_screen/dropdown.dart';
import 'package:flutter_ecommerce_app/views/sell_screen/image_screen.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sellController = Provider.of<SellController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            sellController.isLoading
                ? loadingIndicator()
                : TextButton(
                    onPressed: () async {
                      sellController.isLoading = true;
                      // await sellController.uploadImageToDatabase(image: image!);
                      await sellController.uploadProducts(
                          context: context, image: sellController.image);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sell',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: whiteColors,
                          fontSize: 18),
                    ),
                  )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: sellController.productNameController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      labelStyle: TextStyle(fontSize: 17, color: appColors),
                      hintText: 'Product Name',
                      hintStyle: const TextStyle(fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: sellController.descController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(fontSize: 17, color: appColors),
                      hintText: 'Description',
                      hintStyle: const TextStyle(fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: sellController.priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(fontSize: 17, color: appColors),
                      hintText: 'Price',
                      hintStyle: const TextStyle(fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: sellController.quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      labelStyle: TextStyle(fontSize: 17, color: appColors),
                      hintText: 'Quantity',
                      hintStyle: const TextStyle(fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: sellController.sellerNameController,
                    decoration: InputDecoration(
                      labelText: 'Seller Name',
                      labelStyle: TextStyle(fontSize: 17, color: appColors),
                      hintText: 'Seller Name',
                      hintStyle: const TextStyle(fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDown(
                      hint: "Category", list: sellController.categoryList),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDown(
                      hint: "Subcategory",
                      list: sellController.subcategoryList),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const Text(
                  'Choose product images',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ImageScreen(),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Choose product color',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: List.generate(9, (index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            sellController.selectedColorIndex = index;
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: colors[index],
                            ),
                          ),
                        ),
                        sellController.selectedColorIndex == index
                            ? IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.done,
                                  color: whiteColors,
                                ))
                            : const SizedBox(),
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
