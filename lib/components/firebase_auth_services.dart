import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/components/toast.dart';
class FirebaseAuthServices {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'email already in use');
      } else {
        showToast(message: e.code);
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      showToast(message: 'Logged in');
      return credential.user;
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-credential') {
        showToast(message: 'email or password wrong');
      } else {
        showToast(message: e.code);
      }
    }
    return null;
  }

}