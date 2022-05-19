import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Auth extends ChangeNotifier {
  String userName;
  String token;
  String expiryDate;

  Future<void> signUp(String email, String password) async {
    final String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDHi7X7PlIl9O8wMtdSbanT6rP0I1jHq2Y';
       var response = await http.post(url, body: json.encode({'email': email, 'password': password, 'returnSecureToken': true}));

    print(response.body);

  }
}
