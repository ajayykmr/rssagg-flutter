
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rssagg_flutter/common/utils/utils.dart';

//we are storing current user in the form of JSON string
class CurrentUserDataProvider {
  final _flutterSecureStorage = const FlutterSecureStorage();

  //returns user in the form of jsonString (String, not Map<String, dynamic>)
  Future<String> getCurrentUser() async {
    try {
      final userJsonString =
          await _flutterSecureStorage.read(key: Constants.currentUserKey);

      if (userJsonString == null || userJsonString.isEmpty) {
        throw Exception("No user found");
      }
      return userJsonString;
    } catch (e) {
      if (e.toString().contains("No user found")) {
        rethrow;
      }
      throw Exception("Error getting current user from secure storage");
    }
  }

  //receives user in the form of jsonString (String, not Map<String, dynamic>)
  Future<void> saveCurrentUser(String userJsonString) async {
    try {
      await _flutterSecureStorage.write(
          key: Constants.currentUserKey, value: userJsonString);
    } catch (e) {
      throw Exception("Error saving current user to secure storage");
    }
  }

  Future<void> logoutCurrentUser() async {
    try {
      await _flutterSecureStorage.delete(key: Constants.currentUserKey);
    } catch (e) {
      throw Exception("Error deleting current user from secure storage");
    }
  }
}