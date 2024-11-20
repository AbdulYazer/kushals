class JewelType {
  // List<ProductElement> products;
  String jewelType;
  String jewelImageUrl;
  // int limit;

  JewelType({
    // required this.JewelTypes,
    required this.jewelType,
    required this.jewelImageUrl,
    // required this.limit,
  });

  factory JewelType.fromJson(Map<String, dynamic> json) => JewelType(
        // products: List<ProductElement>.from(
        //     json["products"].map((x) => ProductElement.fromJson(x))),
        jewelType: json["jewelType"],
        jewelImageUrl: json["jewelImageUrl"],
        // limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        // "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "jewelType": jewelType,
        "jewelImageUrl": jewelImageUrl,
        // "limit": limit,
      };
}

class Feature {
  String name;
  String iconUrl;

  Feature({
    required this.name,
    required this.iconUrl,
  });
}
