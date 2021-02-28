import 'package:drept_civil/services/app_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Keychain {
  final _storage = new FlutterSecureStorage();

  static const String _USERNAME_FIELD_NAME = "username";
  static const String _PASSWORD_FIELD_NAME = "password";

  Keychain();

  static final _instance = new Keychain();

  static Keychain getInstance() {
    return _instance;
  }

  Future<bool> _keyExists({@required String key}) async {
    return await _getValue(key: key) != null;
  }

  Future<String> _getValue({@required String key}) async {
    if (key != null)
      return await _storage.read(key: key);
    else
      return null;
  }

  Future<void> _deleteKeyValuePair({@required String key}) async {
    _storage.delete(key: key);
  }

  Future<String> _getUsername() async {
    return _getValue(key: _USERNAME_FIELD_NAME);
  }

  Future<String> _getPassword() async {
    return _getValue(key: _PASSWORD_FIELD_NAME);
  }

  Future<void> _store({@required String key, @required String value}) async {
    if (key != null && value != null)
      await _storage.write(key: key, value: value);
    else if (key == null)
      throw new ArgumentError.notNull("key");
    else
      throw new ArgumentError.notNull("value");
  }

  Future<void> saveUsername({@required String value}) async {
    await _store(key: _USERNAME_FIELD_NAME, value: value);
  }

  Future<void> savePassword({@required String value}) async {
    await _store(key: _PASSWORD_FIELD_NAME, value: value);
  }

  Future<bool> areCredentialsSaved() async {
    return await _keyExists(key: _USERNAME_FIELD_NAME) &&
        await _keyExists(key: _PASSWORD_FIELD_NAME);
  }

  Future<bool> authenticateUsingSavedCredentials() async {
    if (await areCredentialsSaved()) {
      String username = await _getUsername();
      String password = await _getPassword();

      return await AppClient.getInstance().authenticate(username, password);
    } else
      return false;
  }

  Future<void> destroyCredentials() {
    _deleteKeyValuePair(key: _USERNAME_FIELD_NAME);
    _deleteKeyValuePair(key: _PASSWORD_FIELD_NAME);
  }
}
