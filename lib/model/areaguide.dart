import 'dart:convert';

List<Areaguide> areaguideFromJson(String str) =>
    List<Areaguide>.from(json.decode(str).map((x) => Areaguide.fromJson(x)));

String areaguideToJson(List<Areaguide> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Areaguide {
  Areaguide({
    required this.propertyImage,
    required this.propertyTitle,
    required this.locationCity,
    required this.locationArea,
    required this.propertyDescription,
    required this.propertyPrice,
  });

  String propertyImage;
  String propertyTitle;
  String locationCity;
  String locationArea;
  String propertyDescription;
  String propertyPrice;

  factory Areaguide.fromJson(Map<String, dynamic> json) => Areaguide(
        propertyImage: json["property_image"],
        propertyTitle: json["property_title"],
        locationCity: json["location_city"],
        locationArea: json["location_area"],
        propertyDescription: json["property_description"],
        propertyPrice: json["property_price"],
      );

  Map<String, dynamic> toJson() => {
        "property_image": propertyImage,
        "property_title": propertyTitle,
        "location_city": locationCity,
        "location_area": locationArea,
        "property_description": propertyDescription,
        "property_price": propertyPrice,
      };
}
