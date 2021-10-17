import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

//Function to write a value into secure storage
  static Future writeSecureStorage(String key, String value) async {
    var writtenData = await secureStorage.write(key: key, value: value);
    return writtenData;
  }

//Function to read a value from secure storage by providing the key of the value
  static Future readSecureStorage(String key) async {
    String? readData = await secureStorage.read(key: key);
    return readData;
  }

//Function to read a value from secure storage by providing the key of the value. Use function at logout
  static Future deleteSecureStorage() async {
    var deleteData = await secureStorage.deleteAll();
    return deleteData;
  }
}
