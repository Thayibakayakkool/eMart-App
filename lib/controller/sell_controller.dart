import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/constant/firebase_constant.dart';
import 'package:flutter_ecommerce_app/constant/utils.dart';
import 'package:flutter_ecommerce_app/models/category_models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SellController extends ChangeNotifier {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController sellerNameController = TextEditingController();

  Uint8List? _image;

  Uint8List? get image => _image;

  set image(Uint8List? value) {
    _image = value;
    notifyListeners();
  }

  String? _selectedName;

  String? get selectedName => _selectedName;

  set selectedName(String? value) {
    _selectedName = value;
    notifyListeners();
  }

  var _categoryList = <String>[];

  get categoryList => _categoryList;

  set categoryList(value) {
    _categoryList = value;
    notifyListeners();
  }

  var _subcategoryList = <String>[];

  get subcategoryList => _subcategoryList;

  set subcategoryList(value) {
    _subcategoryList = value;
    notifyListeners();
  }

  List<Category> category = [];

  bool isLoading = false;
  var _categoryvalue = '';

  get categoryvalue => _categoryvalue;

  set categoryvalue(value) {
    _categoryvalue = value;
    notifyListeners();
  }

  var _subcategoryvalue = '';

  get subcategoryvalue => _subcategoryvalue;

  set subcategoryvalue(value) {
    _subcategoryvalue = value;
    notifyListeners();
  }

  var _selectedColorIndex = 0;

  get selectedColorIndex => _selectedColorIndex;

  set selectedColorIndex(value) {
    _selectedColorIndex = value;
    notifyListeners();
  }

  getCategories() async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
    notifyListeners();
  }

  populateCategoryList() {
    _categoryList.clear();

    for (var item in category) {
      _categoryList.add(item.name);
      notifyListeners();
    }
    notifyListeners();
  }

  populateSubcategory(cat) {
    _subcategoryList.clear();

    var data = category.where((element) => element.name == cat).toList();

    for (var i = 0; i < data.first.subcategory.length; i++) {
      _subcategoryList.add(data.first.subcategory[i]);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    return task.ref.getDownloadURL();
  }

  uploadProducts({context, Uint8List? image}) async {
    String uid = getUid();
    String url = await uploadImageToDatabase(image: image!, uid: uid);
    var store = firestore.collection(productCollection).doc();
    await store.set({
      'is_featured': false,
      'p_category': _categoryvalue,
      'p_subcategory': _subcategoryvalue,
      'p_colors': FieldValue.arrayUnion(
          [Colors.red.value, Colors.blue.value, Colors.purple.value]),
      'p_imgs': url,
      'p_wishlist': FieldValue.arrayUnion([]),
      'p_desc': descController.text,
      'p_name': productNameController.text,
      'p_price': priceController.text,
      'p_quantity': quantityController.text,
      'p_seller': sellerNameController.text,
      'p_rating': 5,
      'vendor_id': currentUser!.uid
    });
    isLoading = false;
    Utils().showSnackBars(context: context, content: "Product uploaded");
  }

  addFeatured(docId) async {
    await firestore
        .collection(productCollection)
        .doc(docId)
        .set({'is_featured': true}, SetOptions(merge: true));
  }

  removeFeatured(docId) async {
    await firestore
        .collection(productCollection)
        .doc(docId)
        .set({'is_featured': false}, SetOptions(merge: true));
  }

  removedProduct(docId) async {
    await firestore.collection(productCollection).doc(docId).delete();
  }

  Future<Uint8List?> pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
    return file!.readAsBytes();
  }

  String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }
}
