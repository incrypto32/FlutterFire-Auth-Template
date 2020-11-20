import 'package:firebase_core/firebase_core.dart';
import 'package:neurodb/logic/services/firebase/auth_service.dart';

class FirebaseService {
  AuthService authService;

  Future<FirebaseApp> initialize() async {
    var app = await Firebase.initializeApp();
    authService = AuthService();
    return app;
  }
}
