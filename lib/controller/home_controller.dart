import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';

class HomeController extends ChangeNotifier {
  var _currentNavIndex = 0;

  get currentNavIndex => _currentNavIndex;

  set currentNavIndex(value) {
    _currentNavIndex = value;
    notifyListeners();
  }

  var _username = '';

  get username => _username;

  set username(value) {
    _username = value;
    notifyListeners();
  }

  var searchController = TextEditingController();

  getUsername() async {
    var n = await firestore
        .collection(userCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });

    _username = n;
    notifyListeners();
  }
}
