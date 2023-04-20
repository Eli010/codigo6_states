import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  getPost() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(url);
    //valido
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data;
    }
    return [];
  }
}
