import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/guitar_model.dart';

class GuitarProvider with ChangeNotifier {
  List<GuitarModel> _guitars = <GuitarModel>[];

  final url = Uri.parse(
      "https://maskimmm.github.io/dummy_datas/guitars_dummy_datas.json");

  List<GuitarModel> get guitars {
    return [..._guitars];
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get(url);
      final extractedDatas = json.decode(response.body);
      List<GuitarModel> loadedDatas = [];

      extractedDatas['guitars'].forEach((guitar) {
        final currentData = GuitarModel(
          id: int.parse(guitar['id'].toString()),
          brand: guitar['brand'].toString(),
          type: guitar['type'].toString(),
          price: double.parse(guitar['price'].toString()),
          desc: guitar['desc'].toString(),
          imgUrl: guitar['imgUrl'].toString(),
        );
        print("urls: ${currentData.imgUrl}");
        loadedDatas.add(currentData);
      });

      _guitars = loadedDatas;
    } catch (err) {
      print("test: $err");
      rethrow;
    }
  }
}
