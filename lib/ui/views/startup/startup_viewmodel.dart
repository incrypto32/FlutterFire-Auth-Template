import 'package:neurodb/app/architecture/view_model.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';

class StartUpViewModel extends ViewModel {
  StartUpViewModel(this.firebaseService) {
    _init();
  }

  final FirebaseService firebaseService;

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  _setLoggedIn(bool val) {
    print("called setLoggedIn");
    _isLoggedIn = val;
    notifyListeners();
  }

  void _init() async {
    setBusy(true);
    print("Initializing Startup View");
    try {
      await firebaseService.initialize();
      firebaseService.authService.onAuthStateChanged((user) {
        _setLoggedIn(user != null);
      });
    } catch (e) {
      if (e is Exception) {}
    }
    setBusy(false);
  }
}
