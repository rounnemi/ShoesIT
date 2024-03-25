class Product {
  final String id;
  final String title;
  final String description;
  final String image;
  final String offreTag  ;
  final int price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.offreTag
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      offreTag: json['offreTag']
    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price ;
    data['offreTag'] = offreTag;
    return data;
  }

}