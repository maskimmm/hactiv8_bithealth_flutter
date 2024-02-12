import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

// Example Asynchronous with `Then`
void fetchToDoDatas(int index) {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$index');

  http.get(url).then((value) {
    final extractedDatas = json.decode(value.body);
    log(extractedDatas.toString());
  }).catchError((err) {
    log(err.toString());
  });
}

// Example Asynchronous with `Async/Await`
void fetchToDoDatas2(int index) async {
  try {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$index');
    final resp = await http.get(url);
    final extractedDatas = json.decode(resp.body);
    log(extractedDatas.toString());
  } catch (err) {
    log(err.toString());
  }
}
