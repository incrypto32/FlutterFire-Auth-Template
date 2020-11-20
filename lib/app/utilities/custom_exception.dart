class AuthException implements Exception {
  final String message;
  const AuthException({this.message});
}

class WrongPassword extends AuthException {}
