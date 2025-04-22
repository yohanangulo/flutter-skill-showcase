abstract class SecureStorage {
  Future<void> saveString(String key, String value);
  Future<String> getString(String key);
  Future<void> deleteString(String key);
}
