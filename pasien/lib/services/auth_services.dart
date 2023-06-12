import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final String email;
  final String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthServices({this.email = "", this.password = ""});

  Future<Map<String, dynamic>> signIn() async {
    try {
      final UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return {"isvalid": true, "data": res.user};
    } catch (e) {
      return {"isvalid": false, "data": e.toString()};
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
