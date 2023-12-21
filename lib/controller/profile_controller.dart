import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends ChangeNotifier {
  var _profileImagePath = '';

  get profileImagePath => _profileImagePath;

  set profileImagePath(value) {
    _profileImagePath = value;
    notifyListeners();
  }

  var _profileImageLink = '';

  get profileImageLink => _profileImageLink;

  set profileImageLink(value) {
    _profileImageLink = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      _profileImagePath = img.path;
      notifyListeners();
    } on PlatformException catch (e) {
      Utils().showSnackBars(context: context, content: e.message.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(_profileImagePath);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(_profileImagePath));
    _profileImageLink = await ref.getDownloadURL();
    notifyListeners();
  }

  updateProfile({name, password, imageUrl}) async {
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imageUrl,
    }, SetOptions(merge: true));
    _isLoading = false;
  }
}
