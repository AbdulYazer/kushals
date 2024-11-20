class JewelType {
  String jewelType;
  String jewelImageUrl;

  JewelType({
    required this.jewelType,
    required this.jewelImageUrl,
  });

  factory JewelType.fromJson(Map<String, dynamic> json) => JewelType(
        jewelType: json["jewelType"],
        jewelImageUrl: json["jewelImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "jewelType": jewelType,
        "jewelImageUrl": jewelImageUrl,
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
