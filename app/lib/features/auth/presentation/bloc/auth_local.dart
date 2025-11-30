import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocal {
  static final _storage = const FlutterSecureStorage();

  static Future<String?> getToken() => _storage.read(key: 'token');
  static Future<String?> getUserId() => _storage.read(key: 'userId');
}
