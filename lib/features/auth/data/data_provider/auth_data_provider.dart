import 'dart:async';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:rssagg_flutter/common/utils/utils.dart';

//data providers provide data in raw format
class AuthDataProvider {
  static const String BASE_URL = Constants.BASE_URL;

  Future<String> signIn(String email, String password) async {
    try {
      const url = '$BASE_URL/login';

      final res = await http.post(
        Uri.parse(url),
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (res.statusCode != 200) {
        throw Exception(res.body);
      }

      return res.body;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      const url = '$BASE_URL/signup';
      final res = await http.post(
        Uri.parse(url),
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (res.statusCode != 201) {
        throw Exception(res.body);
      }

      return res.body;
    } catch (e) {
      rethrow;
    }
  }


}
