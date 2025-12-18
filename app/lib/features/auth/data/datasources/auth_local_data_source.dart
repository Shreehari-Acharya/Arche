import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _keyToken = 'auth_token';
  static const String _keyUserId = 'user_id';
  static const String _keyEmail = 'user_email';

  // Save authentication data
  Future<void> saveAuthData({
    required String token,
    required String userId,
    required String email,
  }) async {
    await Future.wait([
      _storage.write(key: _keyToken, value: token),
      _storage.write(key: _keyUserId, value: userId),
      _storage.write(key: _keyEmail, value: email),
    ]);
  }

  // Get saved token
  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  // Get user ID
  Future<String?> getUserId() async {
    return await _storage.read(key: _keyUserId);
  }

  // Get email
  Future<String?> getEmail() async {
    return await _storage.read(key: _keyEmail);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // Clear all authentication data (logout)
  Future<void> clearAuthData() async {
    await Future.wait([
      _storage.delete(key: _keyToken),
      _storage.delete(key: _keyUserId),
      _storage.delete(key: _keyEmail),
    ]);
  }
}
