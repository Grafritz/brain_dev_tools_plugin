import 'dart:math' as math;

class Generator {
  /// Generates a cryptographically secure random nonce of the specified length.
  /// Defaults to 32 characters, which is recommended for most use cases.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }
}
