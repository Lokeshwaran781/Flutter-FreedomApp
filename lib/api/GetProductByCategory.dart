import 'dart:convert';
import 'package:freedom_app/models/ProductModel.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>?> getProductByCategories(String cat) async {
  var url = Uri.parse('https://fakestoreapi.com/products/category/' + cat);
  try {
    final response = await http.get(url);
    print('response_body:${response.body}');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      print('Error: ');
      print(response.statusCode);
    }
  } catch (e) {
    print("Exception Occured:");
    print(e);
  }
  return null;
}
