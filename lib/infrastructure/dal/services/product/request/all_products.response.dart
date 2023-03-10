class AllProductsResponse {
  List<ProductsResponseData> products;
  String? message;

  AllProductsResponse({this.products = const <ProductsResponseData>[]});

  factory AllProductsResponse.fromJson(List json) {
    List<ProductsResponseData> products = [];
    for (var v in json) {
      products.add(ProductsResponseData.fromJson(v));
    }
    return AllProductsResponse(products: products);
  }
}

class ProductsResponseData {
  int? id;
  String? title;

  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductsResponseData({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ProductsResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating?.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating?.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
