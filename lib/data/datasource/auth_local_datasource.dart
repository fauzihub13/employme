import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDatasource {
  final _storage = FlutterSecureStorage();

  
  Future<String?> getToken() async {
    return await _storage.read(key: 'access_token');
  }

  
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  
  Future<void> updateToken(String token) async {
    await saveToken(token);
  }

  
  Future<void> deleteToken() async {
    await _storage.delete(key: 'access_token');
  }
}
