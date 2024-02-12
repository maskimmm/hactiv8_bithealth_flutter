enum Endpoint { fetchAlbumDatas, fetchPostDatas, fetchUserDatas }

extension PlaceholderAPI on Endpoint {
  String get url {
    switch (this) {
      case Endpoint.fetchAlbumDatas:
        return "http://jsonplaceholder.typicode.com/albums";
      case Endpoint.fetchPostDatas:
        return "http://jsonplaceholder.typicode.com/posts";
      case Endpoint.fetchUserDatas:
        return "http://jsonplaceholder.typicode.com/users";
    }
  }
}
