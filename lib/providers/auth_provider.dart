// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception_model.dart';

class AuthProvider extends ChangeNotifier {
  String _token = "";

  String get token {
    return _token;
  }

  Future<void> login(String email, String password) async {
    try {
      if (email == "admin@mail.com" && password == "qweqwe") {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', "token");
        _token = "token";
        notifyListeners();
      } else {
        throw HttpException("Invalid email or password");
      }
    } catch (err) {
      print("error di provider: $err");
      rethrow;
    }
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("token")) {
      return false;
    }

    _token = prefs.getString("token") as String;

    return true;
  }
}
