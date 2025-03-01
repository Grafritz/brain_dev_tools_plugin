// ignore_for_file: prefer_typing_uninitialized_variables

class TextEmptyException implements Exception {
  final message;

  TextEmptyException([this.message]);

  @override
  String toString() {
    if (message == null) return "TextEmptyException";
    return "$message";
  }
}