import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  User? currentUser = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> cartList = [];

  Future uploadDataToFirebase(
      String date, String foodItem, String numberPeople, bool isPacking) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('cart');
    ref.doc(currentUser!.uid).set({
      'date': date,
      'food_items': foodItem,
      'number_of_people': numberPeople,
      'packing': isPacking ? "Packing" : "In-House",
    });
  }

  // getValue() {
  //   Future<QuerySnapshot<Map<String, dynamic>>> ref =
  //       FirebaseFirestore.instance.collection('cart').get();
  //   print();
  // }
}
