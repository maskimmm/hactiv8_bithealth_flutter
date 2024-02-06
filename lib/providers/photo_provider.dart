import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hactiv8_bithealth_flutter/models/photo_model.dart';

class PhotoProvider with ChangeNotifier {
  List<PhotoModel> _photoDatas = <PhotoModel>[];

  List<PhotoModel> get photoDatas {
    return [..._photoDatas];
  }

  Future<void> fetchPhotoDatas({required int id}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://jsonplaceholder.typicode.com/albums/${id.toString()}/photos"));

      final decodedData = json.decode(response.body);
      List<PhotoModel> photos = [];

      decodedData.forEach((post) {
        photos.add(PhotoModel.fromJson(post));
      });

      _photoDatas = photos;
    } catch (err) {
      rethrow;
    }
  }
}
