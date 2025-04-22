import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_skill_showcase/src/core/secure_storage/src/domain/secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SecureStorage)
class SecureStorageImpl implements SecureStorage {
  SecureStorageImpl(this.secureStorage);

  final FlutterSecureStorage secureStorage;

  @override
  Future<void> deleteString(String key) async {
    await secureStorage.delete(key: key);
  }

  @override
  Future<String> getString(String key) async {
    return await secureStorage.read(key: key) ?? '';
  }

  @override
  Future<void> saveString(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }
}
