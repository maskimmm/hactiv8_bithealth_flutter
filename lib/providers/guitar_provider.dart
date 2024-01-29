import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/guitar_model.dart';

class GuitarProvider with ChangeNotifier {
  List<GuitarModel> _guitars = <GuitarModel>[];

  final url = Uri.parse("https://localhost/guitars");

  List<GuitarModel> get guitars {
    return [..._guitars];
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get(url);
      final extractedDatas = json.decode(response.body);
      List<GuitarModel> loadedDatas = [];

      extractedDatas.forEach((guitar) {
        final currentData = GuitarModel(
          id: guitar['id'],
          brand: guitar['brand'],
          type: guitar['type'],
          price: guitar['price'],
          desc: guitar['desc'],
          imgURL: guitar['imgURL'],
        );
        loadedDatas.add(currentData);
      });

      _guitars = loadedDatas;
    } catch (err) {
      rethrow;
    }
  }
}
