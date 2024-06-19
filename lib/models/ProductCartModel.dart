class ProductCartModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  int quantity;

  ProductCartModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.quantity});

  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      ProductCartModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
