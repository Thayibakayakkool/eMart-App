import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/controller/home_controller.dart';
import 'package:provider/provider.dart';

class CartController extends ChangeNotifier {
  double _totalP = 0;

  get totalP => _totalP;

  set totalP(value) {
    _totalP = value;
    notifyListeners();
  }

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var _paymentIndex = 0;

  get paymentIndex => _paymentIndex;

  set paymentIndex(value) {
    _paymentIndex = value;
    notifyListeners();
  }

  late dynamic productSnapshot;
  var products = [];

  bool _placingOrder = false;

  bool get placingOrder => _placingOrder;

  set placingOrder(bool value) {
    _placingOrder = value;
    notifyListeners();
  }

  calculate(data) {
    _totalP = 0;
    for (var i = 0; i < data.length; i++) {
      _totalP = _totalP + double.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    _paymentIndex = index;
    notifyListeners();
  }

  placeMyOrder(
      {required orderPaymentMethod, required totalAmount, context}) async {
    _placingOrder = true;
    await getProductDetails();
    await firestore.collection(orderCollections).doc().set({
      'order_code': "233981237",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name':
          Provider.of<HomeController>(context, listen: false).username,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      "order_by_postalcode": postalCodeController.text,
      'shipping_method': "Home Delivery",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products)
    });
    _placingOrder = false;
    notifyListeners();
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'img': productSnapshot[i]['img'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'tprice': productSnapshot[i]['tprice'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title'],
      });
    }
    notifyListeners();
  }

  clearCart() {
    for (var i = 0; i < productSnapshot.length; i++) {
      firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
    notifyListeners();
  }
}
