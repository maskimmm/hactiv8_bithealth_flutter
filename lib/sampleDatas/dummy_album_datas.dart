import '../models/album_model.dart';

final List<Map<String, dynamic>> _jsonData = [
  {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim",
  },
  {
    "userId": 1,
    "id": 2,
    "title": "sunt qui excepturi placeat culpa",
  },
  {
    "userId": 1,
    "id": 3,
    "title": "omnis laborum odio",
  },
];

final List<AlbumModel> dummyAlbum =
    _jsonData.map((itemAlbum) => AlbumModel.fromJson(itemAlbum)).toList();
