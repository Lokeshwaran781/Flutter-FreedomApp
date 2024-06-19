import 'dart:convert';
import 'package:freedom_app/models/ProductModel.dart';
import 'package:http/http.dart' as http;

Future<ProductModel?> getProduct(int id) async {
  var url = Uri.parse('https://fakestoreapi.com/products/' + id.toString());
  try {
    final response = await http.get(url);
    print('response_body: ${response.body}');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return ProductModel.fromJson(jsonResponse);
    } else {
      print('Error: ');
      print(response.statusCode);
    }
  } catch (e) {
    print("Exception Occurred:");
    print(e);
  }
  return null;
}
