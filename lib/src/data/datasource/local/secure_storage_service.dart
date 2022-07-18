import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static FlutterSecureStorage? _storage;
  static final SecureStorageService sss = SecureStorageService._();

  SecureStorageService._();

  Future<FlutterSecureStorage> get secureStorage async {
    if (_storage != null) {
      return _storage!;
    }

    _storage = await initSSS();

    return _storage!;
  }

  Future<FlutterSecureStorage> initSSS() async {
    FlutterSecureStorage storage = new FlutterSecureStorage(
        aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ));

    return storage;
  }
}
