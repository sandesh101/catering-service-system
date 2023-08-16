import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  CollectionReference ref = FirebaseFirestore.instance.collection('cart');

  User? currentUser = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> _cartList = [];
  bool _isUploading = false;

  List<Map<String, dynamic>> get cartList => _cartList;
  bool get isUploading => _isUploading;

  setCart(List<Map<String, dynamic>> cartValue) {
    _cartList = cartValue;
    print("CART: $_cartList");
    notifyListeners();
  }

  setUploading(bool value) {
    _isUploading = value;
    notifyListeners();
  }

  Future<void> getOrders() async {
    try {
      QuerySnapshot querySnapshot =
          await ref.where('user_id', isEqualTo: currentUser!.uid).get();
      _cartList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      setCart(_cartList);
    } catch (e) {
      print(e.toString());
    }
  }

  // Future uploadDataToFirebase(
  //     String date, String foodItem, String numberPeople, bool isPacking) async {
  //   CollectionReference ref = FirebaseFirestore.instance.collection('cart');
  //   await ref.add({
  //     'date': date,
  //     'food_items': foodItem,
  //     'number_of_people': numberPeople,
  //     'packing': isPacking ? "Packing" : "In-House",
  //   });
  // }
  Future uploadDataToFirebase(
      String date, String foodItem, String numberPeople, bool isPacking) async {
    setUploading(true);

    // Add a new document with an auto-generated ID
    try {
      final docRef = await ref.add({
        'user_id': currentUser!.uid,
        'date': date,
        'food_items': foodItem,
        'number_of_people': numberPeople,
        'packing': isPacking ? "Packing" : "In-House",
      });
      final orderId = docRef.id;
      await docRef.update({'order_id': orderId}).then((value) {
        setUploading(false);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  removeOrder(String orderId) async {
    try {
      await ref.doc(orderId).delete();
      // Remove the order from the _cartList
      _cartList.removeWhere((order) => order['orderId'] == orderId);
      setCart(_cartList);
    } catch (e) {
      print(e.toString());
    }
  }
}
