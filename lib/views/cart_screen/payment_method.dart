import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/controller/cart_controller.dart';
import 'package:flutter_ecommerce_app/views/home_screen/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColors,
        title: const Text(
          "Choose Payment Method",
          style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: cartController.placingOrder
            ? Center(
                child: loadingIndicator(),
              )
            : ElevatedButton(
                onPressed: () async {
                  await cartController.placeMyOrder(
                      orderPaymentMethod:
                          paymentMethods[cartController.paymentIndex],
                      totalAmount: cartController.totalP,
                      context: context);

                  await cartController.clearCart();
                  Utils().showSnackBars(
                      context: context, content: "Order placed successfully");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BottomNavigationBars()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(appColors)),
                child: const Text(
                  "Place my order",
                  style: TextStyle(color: whiteColors),
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: List.generate(
            paymentMethodsImg.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  cartController.changePaymentIndex(index);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: cartController.paymentIndex == index
                            ? tealColor
                            : transparent,
                        width: 4,
                      )),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.network(
                        paymentMethodsImg[index],
                        width: double.infinity,
                        height: 120,
                        colorBlendMode: cartController.paymentIndex == index
                            ? BlendMode.darken
                            : BlendMode.color,
                        color: cartController.paymentIndex == index
                            ? Colors.black.withOpacity(0.4)
                            : Colors.transparent,
                        fit: BoxFit.cover,
                      ),
                      cartController.paymentIndex == index
                          ? Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  activeColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  value: true,
                                  onChanged: (value) {}),
                            )
                          : Container(),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: Text(
                            paymentMethods[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
