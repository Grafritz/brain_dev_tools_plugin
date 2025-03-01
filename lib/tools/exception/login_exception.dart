// ignore_for_file: prefer_typing_uninitialized_variables

class LoginException implements Exception {
  final message;

  LoginException([this.message]);

  @override
  String toString() {
    if (message == null) return "LoginException";
    return "$message";
  }
}
