import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getCategories() async {
  var url = Uri.parse('https://fakestoreapi.com/products/categories');
  var res = await http.get(url);
  var result = jsonDecode(res.body);
  return result;
}
