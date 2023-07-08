import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
