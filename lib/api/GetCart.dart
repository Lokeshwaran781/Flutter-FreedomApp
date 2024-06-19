import 'dart:convert';
import 'package:freedom_app/api/GetProduct.dart';
import 'package:freedom_app/models/ProductCartModel.dart';
import 'package:freedom_app/models/ProductModel.dart';
import 'package:http/http.dart' as http;

Future<List<ProductCartModel>> getCart() async {
  var url = Uri.parse('https://fakestoreapi.com/carts/user/1');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    List<ProductCartModel> cart = [];

    if (result.isNotEmpty) {
      for (var res in result[0]['products']) {
        ProductModel? prod = await getProduct(res['productId']);
        if (prod != null) {
          ProductCartModel productCart = ProductCartModel(
            id: res['productId'],
            title: prod.title,
            price: prod.price,
            description: prod.description,
            category: prod.category,
            image: prod.image,
            quantity: res['quantity'],
          );
          cart.add(productCart);
        }
      }
    }
    return cart;
  } else {
    throw Exception('Failed to load cart');
  }
}
