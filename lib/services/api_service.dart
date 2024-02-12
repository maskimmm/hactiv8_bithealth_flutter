import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/enums/endpoint.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';

class APIService {
  static final shared = APIService();

  Future<List<AlbumModel>> fetchAlbumDatas() async {
    try {
      final response = await http.get(Uri.parse(Endpoint.fetchAlbumDatas.url));

      final decodedData = json.decode(response.body);
      List<AlbumModel> albums = [];

      decodedData.forEach((post) {
        albums.add(AlbumModel.fromJson(post));
      });

      return albums;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<PhotoModel>> fetchPhotoDatas({required int id}) async {
    try {
      final response = await http.get(
          Uri.parse("${Endpoint.fetchAlbumDatas.url}/${id.toString()}/photos"));

      final decodedData = json.decode(response.body);
      List<PhotoModel> photos = [];

      decodedData.forEach((post) {
        photos.add(PhotoModel.fromJson(post));
      });

      return photos;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<PostModel>> fetchPostDatas() async {
    try {
      final response = await http.get(Uri.parse(Endpoint.fetchPostDatas.url));

      final decodedData = json.decode(response.body);
      List<PostModel> posts = [];

      decodedData.forEach((post) {
        posts.add(PostModel.fromJson(post));
      });

      return posts;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<UserModel>> fetchUserDatas() async {
    try {
      final response = await http.get(Uri.parse(Endpoint.fetchUserDatas.url));

      final decodedData = json.decode(response.body);
      List<UserModel> users = [];

      decodedData.forEach((post) {
        users.add(UserModel.fromJson(post));
      });

      return users;
    } catch (err) {
      rethrow;
    }
  }
}
