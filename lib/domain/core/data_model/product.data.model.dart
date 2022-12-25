import 'dart:convert';

class ProductDataModel {
  int id;
  String title;

  num price;
  String description;
  String category;
  String image;

  ProductDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (other is ProductDataModel) {
      return hashCode == other.hashCode;
    }
    return false;
  }

  factory ProductDataModel.fromJson(Map<String, dynamic> j) => ProductDataModel(
        id: j['id'],
        title: j['title'],
        price: j['price'],
        description: j['description'],
        category: j['category'],
        image: j['image'],
      );

  factory ProductDataModel.fromString(String s) =>
      ProductDataModel.fromJson(const JsonDecoder().convert(s));

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'image': image,
        'price': price,
      };

  @override
  String toString() {
    return const JsonEncoder.withIndent(' ').convert(toJson());
  }

  @override
  int get hashCode => id.hashCode + title.hashCode;
}
