import 'dart:convert';

import 'package:rssagg_flutter/features/auth/data/data_provider/current_user_data_provider.dart';
import 'package:rssagg_flutter/models/models.dart';

class CurrentUserRepository {
  final CurrentUserDataProvider _currentUserDataProvider;
  CurrentUserRepository(this._currentUserDataProvider);

  Future<User> getCurrentUser() async {
    try{
      //this function receives user in the form of jsonString (String, not Map<String, dynamic>)
      final userJsonString = await _currentUserDataProvider.getCurrentUser();

      if (userJsonString.isEmpty) {
        throw Exception("No user found");
      }

      //convert String to Map<String, dynamic>
      final userJson = jsonDecode(userJsonString) as Map<String, dynamic>;

      //User.fromJson requires Map<String, dynamic>
      return User.fromJson(userJson);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveCurrentUser(User user) async {
    try {
      //user.toJson() returns Map<String, dynamic>
      //we need String
      final userJsonString = jsonEncode(user.toJson());
      await _currentUserDataProvider.saveCurrentUser(userJsonString);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutCurrentUser() async {
    try {
      await _currentUserDataProvider.logoutCurrentUser();
    } catch (e) {
      rethrow;
    }
  }
}