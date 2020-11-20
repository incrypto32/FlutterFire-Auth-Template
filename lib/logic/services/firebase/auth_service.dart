import 'package:firebase_auth/firebase_auth.dart';
import 'package:neurodb/app/utilities/custom_exception.dart';

class AuthService {
  var _auth = FirebaseAuth.instance;

  void onAuthStateChanged(void Function(User) callback) {
    _auth.authStateChanges().listen((callback));
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      e.code == 'wrong-password'
          ? throw WrongPassword()
          : throw AuthException();
    } catch (e) {
      throw AuthException();
    }
  }
}
