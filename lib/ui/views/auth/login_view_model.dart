import 'package:neurodb/app/architecture/view_model.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/app/utilities/custom_exception.dart';
import 'package:neurodb/logic/services/firebase/auth_service.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends ViewModel {
  String _email = "";
  String _password = "";
  final AuthService _authService = locator<FirebaseService>().authService;
  final SnackbarService snackbarService = locator<SnackbarService>();

  String get email => _email;
  String get password => _password;

  void setEmail(val) {
    _email = val;
  }

  void setPassword(val) {
    _password = val;
  }

  void submit() async {
    if (isBusy) {
      return;
    }

    setBusy(true);

    if (email.isEmpty || password.isEmpty) {
      snackbarService.showSnackbar(
        message: "Enter valid details",
        duration: Duration(seconds: 1),
      );
    } else {
      try {
        await _authService.loginWithEmailAndPassword(email, password);
      } catch (e) {
        if (e is AuthException) {
          snackbarService.showSnackbar(
              message: "Wrong password and email combination");
        } else {
          snackbarService.showSnackbar(
              message: "An error occured while trying to login");
        }
      }
    }

    setBusy(false);
  }
}
