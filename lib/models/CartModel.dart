class CartModel {
  int id;
  int userid;
  DateTime date;
  List<Product> products;
  int v;

  CartModel({
    required this.id,
    required this.userid,
    required this.date,
    required this.products,
    required this.v,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userid: json["userid"],
        date: DateTime.parse(json["date"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        v: json["v"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "v": v,
      };
}

class Product {
  int productId;
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
