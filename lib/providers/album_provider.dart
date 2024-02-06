import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/album_model.dart';

class AlbumProvider with ChangeNotifier {
  List<AlbumModel> _albumDatas = <AlbumModel>[];

  List<AlbumModel> get albumDatas {
    return [..._albumDatas];
  }

  Future<void> fetchAlbumDatas() async {
    try {
      final response = await http
          .get(Uri.parse("http://jsonplaceholder.typicode.com/albums"));

      final decodedData = json.decode(response.body);
      List<AlbumModel> albums = [];

      decodedData.forEach((post) {
        albums.add(AlbumModel.fromJson(post));
      });

      _albumDatas = albums;
    } catch (err) {
      rethrow;
    }
  }
}
