import 'dart:convert';

import 'package:http/http.dart' as http;

// Asynchronous with `Then`
void fetchToDoDatas(int index) {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$index');

  http.get(url).then((value) {
    final extractedDatas = json.decode(value.body);
    print(extractedDatas);
  }).catchError((err) {
    print(err);
  });
}

// Asynchronous with `Async/Await`
void fetchToDoDatas2(int index) async {
  try {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$index');
    final resp = await http.get(url);
    final extractedDatas = json.decode(resp.body);
    print(extractedDatas);
  } catch (err) {
    print(err);
  }
}
