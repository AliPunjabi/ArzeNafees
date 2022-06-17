import 'dart:convert';

List<Areaview> areaviewFromJson(String str) =>
    List<Areaview>.from(json.decode(str).map((x) => Areaview.fromJson(x)));

String areaviewToJson(List<Areaview> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Areaview {
  Areaview({
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

  factory Areaview.fromJson(Map<String, dynamic> json) => Areaview(
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
