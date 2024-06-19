import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> addtocart(Map<int, int> prod) async {
  var url = Uri.parse('https://fakestoreapi.com/carts');
  var prodlist = [];
  prod.forEach((key, value) {
    if (value != 0) {
      var prodmap = {'productId': key, 'quantity': value};
      prodlist.add(prodmap);
    }
  });
  var body = jsonEncode({
    'userId': 2,
    'date': DateTime.now().toIso8601String(),
    'products': prodlist,
  });
  var res = await http.post(url,
      headers: {'Content-Type': 'application/json'}, body: body);
  var result = jsonDecode(res.body);
  print(result);
}
