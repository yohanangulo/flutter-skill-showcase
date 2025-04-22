import 'package:flutter_skill_showcase/src/core/secure_storage/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDataStorage {
  UserDataStorage(this.secureStorage);

  final SecureStorage secureStorage;

  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  void saveAccessToken(String accessToken) {
    secureStorage.saveString(accessTokenKey, accessToken);
  }

  void saveRefreshToken(String refreshToken) {
    secureStorage.saveString(refreshTokenKey, refreshToken);
  }

  Future<String> getAccessToken() async {
    return secureStorage.getString(accessTokenKey);
  }

  Future<String> getRefreshToken() async {
    return secureStorage.getString(refreshTokenKey);
  }

  void deleteAccessToken() {
    secureStorage.deleteString(accessTokenKey);
  }

  void deleteRefreshToken() {
    secureStorage.deleteString(refreshTokenKey);
  }
}
