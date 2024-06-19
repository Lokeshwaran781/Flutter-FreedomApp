import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> Login(username, password) async {
  var body = {"username": username, "password": password};
  var request = await http
      .post(Uri.parse('https://fakestoreapi.com/auth/login'), body: body);
  if (request.statusCode == 200) {
    var response = jsonDecode(request.body);
    return response['token'];
  } else {
    return request.statusCode.toString();
  }
}
