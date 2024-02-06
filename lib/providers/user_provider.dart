import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _userDatas = <UserModel>[];

  List<UserModel> get userDatas {
    return [..._userDatas];
  }

  Future<void> fetchUserDatas() async {
    try {
      final response = await http
          .get(Uri.parse("http://jsonplaceholder.typicode.com/users"));

      final decodedData = json.decode(response.body);
      List<UserModel> users = [];

      decodedData.forEach((post) {
        users.add(UserModel.fromJson(post));
      });

      _userDatas = users;
    } catch (err) {
      rethrow;
    }
  }
}
