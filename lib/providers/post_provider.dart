import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<PostModel> _postDatas = <PostModel>[];

  List<PostModel> get postDatas {
    return [..._postDatas];
  }

  Future<void> fetchPostDatas() async {
    try {
      final response = await http
          .get(Uri.parse("http://jsonplaceholder.typicode.com/posts"));

      final decodedData = json.decode(response.body);
      List<PostModel> posts = [];

      decodedData.forEach((post) {
        posts.add(PostModel.fromJson(post));
      });

      _postDatas = posts;

      // final decodedData =
      //     json.decode(response.body) as List<Map<String, dynamic>>;
      // _postDatas = decodedData.map((post) => PostModel.fromJson(post)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
