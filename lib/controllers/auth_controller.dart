import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signUpUser(String fullName, String phone, String email,
      String password, String address) async {
    String res = 'Some error occured';
    try {
      if (fullName.isNotEmpty &&
          phone.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          address.isNotEmpty) {
        //create the user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await _firebaseFirestore
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'id': credential.user!.uid,
          'email': email,
          'name': fullName,
          'address': address,
          'phone': phone,
        });
        res = 'success';
      } else {
        res = 'All fields are required';
      }
    } catch (e) {
      print(e.toString());
    }
    return res;
  }
}
