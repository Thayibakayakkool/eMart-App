import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/controller/cart_controller.dart';
import 'package:flutter_ecommerce_app/views/cart_screen/payment_method.dart';
import 'package:provider/provider.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shipping Info',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            if (cartController.addressController.text.length > 10) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PaymentMethods(),
              ));
            } else {
              Utils().showSnackBars(
                  context: context, content: 'Please fill the form');
            }
          },
          child: const Text(
            "Continue",
            style: TextStyle(color: whiteColors),
          ),
          style:
              ButtonStyle(backgroundColor: MaterialStatePropertyAll(appColors)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: cartController.addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(fontSize: 17, color: appColors),
                  hintText: 'Address',
                  hintStyle: TextStyle(fontSize: 18, color: appColors),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
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
                controller: cartController.cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(fontSize: 17, color: appColors),
                  hintText: 'City',
                  hintStyle: TextStyle(fontSize: 18, color: appColors),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
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
                controller: cartController.stateController,
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(fontSize: 17, color: appColors),
                  hintText: 'State',
                  hintStyle: TextStyle(fontSize: 18, color: appColors),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
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
                keyboardType: TextInputType.number,
                controller: cartController.postalCodeController,
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  labelStyle: TextStyle(fontSize: 17, color: appColors),
                  hintText: 'Postal Code',
                  hintStyle: TextStyle(fontSize: 18, color: appColors),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
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
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: cartController.phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(fontSize: 17, color: appColors),
                  hintText: 'Phone',
                  hintStyle: TextStyle(fontSize: 18, color: appColors),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
