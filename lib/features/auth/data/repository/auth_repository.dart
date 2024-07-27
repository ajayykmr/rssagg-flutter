
import 'dart:convert';

import 'package:rssagg_flutter/features/auth/data/data_provider/auth_data_provider.dart';
import 'package:rssagg_flutter/models/models.dart';

//repository is the bridge between data provider and bloc
//it provides data in the form bloc can understand
class AuthRepository{
  final AuthDataProvider _userDataProvider;
  AuthRepository(this._userDataProvider);

  Future<User> login(String email, String password) async {
    try {
      final res = await _userDataProvider.signIn(email, password);
      Map<String, dynamic> user = jsonDecode(res);
      print(user);
      return User.fromJson(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> signUp(String email, String password) async {
    try {
      final res = await _userDataProvider.signUp(email, password);
      Map<String, dynamic> user = jsonDecode(res);
      print(user);
      return User.fromJson(user);
    } catch (e) {
      rethrow;
    }
  }
}