import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/guitar_model.dart';

class GuitarProvider with ChangeNotifier {
  final String _token;
  final url = Uri.parse(
      "https://maskimmm.github.io/dummy_datas/guitars_dummy_datas.json");

  GuitarProvider(this._token);

  List<GuitarModel> _guitars = <GuitarModel>[];
  List<GuitarModel> get guitars {
    return [..._guitars];
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response =
          await http.get(url, headers: {'authorization': 'Bearer $_token'});
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
