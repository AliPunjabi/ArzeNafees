// To parse this JSON data, do
//
//     final areaview = areaviewFromJson(jsonString);

import 'dart:convert';

Areaview areaviewFromJson(String str) => Areaview.fromJson(json.decode(str));

String areaviewToJson(Areaview data) => json.encode(data.toJson());

class Areaview {
  Areaview({
    required this.properties,
  });

  List<Property> properties;

  factory Areaview.fromJson(Map<String, dynamic> json) => Areaview(
        properties: List<Property>.from(
            json["properties"].map((x) => Property.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "properties": List<dynamic>.from(properties.map((x) => x.toJson())),
      };
}

class Property {
  Property({
    required this.propertyImage,
    required this.propertyTitle,
    required this.locationCity,
    required this.locationArea,
    required this.propertyDescription,
    required this.propertyPrice,
  });

  String? propertyImage;
  String propertyTitle;
  String locationCity;
  String locationArea;
  String propertyDescription;
  String propertyPrice;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        propertyImage:
            json["property_image"] == null ? null : json["property_image"],
        propertyTitle: json["property_title"],
        locationCity: json["location_city"],
        locationArea: json["location_area"],
        propertyDescription: json["property_description"],
        propertyPrice: json["property_price"],
      );

  Map<String, dynamic> toJson() => {
        "property_image": propertyImage == null ? null : propertyImage,
        "property_title": propertyTitle,
        "location_city": locationCity,
        "location_area": locationArea,
        "property_description": propertyDescription,
        "property_price": propertyPrice,
      };
}
