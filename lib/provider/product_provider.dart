import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  CollectionReference ref = FirebaseFirestore.instance.collection('products');
  List<dynamic> _productList = [];

  List<dynamic> get productList => _productList;

  setProduct(List<dynamic> products) {
    _productList = products;
    print("PRODUCTS PROVIDER: $_productList");
    notifyListeners();
  }

  Future<void> availableProducts() async {
    QuerySnapshot productSnap = await ref.get();
    _productList = productSnap.docs.map((data) => data.data()).toList();
    setProduct(_productList);
  }
}
