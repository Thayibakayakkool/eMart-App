import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/models/category_models.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';

class ProductController extends ChangeNotifier {
  var _quantity = 0;

  get quantity => _quantity;

  set quantity(value) {
    _quantity = value;
    notifyListeners();
  }

  var _colorIndex = 0;

  get colorIndex => _colorIndex;

  set colorIndex(value) {
    _colorIndex = value;
    notifyListeners();
  }

  var _subCat = [];

  get subCat => _subCat;

  set subCat(value) {
    _subCat = value;
    notifyListeners();
  }

  double _totalPrice = 0;

  get totalPrice => _totalPrice;

  set totalPrice(value) {
    _totalPrice = value;
    notifyListeners();
  }

  bool _isFav = false;

  bool get isFav => _isFav;

  set isFav(bool value) {
    _isFav = value;
    notifyListeners();
  }

  getSubCategories(title) async {
    _subCat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      _subCat.add(e);
    }
    notifyListeners();
  }

  changeColorIndex(index) {
    _colorIndex = index;
    notifyListeners();
  }

  increaseQuantity(totalQuantity) {
    if (_quantity < totalQuantity) {
      _quantity++;
      notifyListeners();
    }
  }

  decreaseQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }

  calculateTotalPrice(price) {
    _totalPrice = price * _quantity;
    notifyListeners();
  }

  addToCart(
      {title, img, sellername, color, qty, tprice, context, vendorId}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      'qty': qty,
      'vendor_id': vendorId,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error) {
      Utils().showSnackBars(context: context, content: error.toString());
    });
    notifyListeners();
  }

  resetValues() {
    _totalPrice = 0;
    _quantity = 0;
    _colorIndex = 0;
    notifyListeners();
  }

  addToWishlist(docId, context) async {
    await firestore.collection(productCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    _isFav = true;
    notifyListeners();
    Utils().showSnackBars(context: context, content: "Added to wishlist");
  }

  removeFromWishlist(docId, context) async {
    await firestore.collection(productCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    _isFav = false;
    notifyListeners();
    Utils().showSnackBars(context: context, content: "Removed from wishlist");
  }

  checkIfFav(data) async {
    if (data['p_wishlist'].contains(currentUser!.uid)) {
      _isFav = true;
    } else {
      _isFav = false;
    }
    notifyListeners();
  }

  dynamic _productMethod;

  dynamic get productMethod => _productMethod;

  set productMethod(dynamic value) {
    _productMethod = value;
    notifyListeners();
  }

  switchCategory(title) {
    if (subCat.contains(title)) {
      productMethod = FirestoreServices.getSubCategoryProducts(title);
    } else {
      productMethod = FirestoreServices.getProducts(title);
    }
    notifyListeners();
  }
}
