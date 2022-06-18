// To parse this JSON data, do
//
//     final areaguide = areaguideFromJson(jsonString);

import 'dart:convert';

Areaguide areaguideFromJson(String str) => Areaguide.fromJson(json.decode(str));

String areaguideToJson(Areaguide data) => json.encode(data.toJson());

class Areaguide {
  Areaguide({
    required this.propertySale,
    required this.propertyRent,
    required this.areaGuide,
    required this.areaGuideImg64,
    required this.areaGuideVideoUrl,
  });

  int propertySale;
  int propertyRent;
  List<AreaGuide> areaGuide;
  List<String> areaGuideImg64;
  String areaGuideVideoUrl;

  factory Areaguide.fromJson(Map<String, dynamic> json) => Areaguide(
        propertySale: json["property_sale"],
        propertyRent: json["property_rent"],
        areaGuide: List<AreaGuide>.from(
            json["areaGuide"].map((x) => AreaGuide.fromJson(x))),
        areaGuideImg64: List<String>.from(json["areaGuideImg64"].map((x) => x)),
        areaGuideVideoUrl: json["areaGuideVideoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "property_sale": propertySale,
        "property_rent": propertyRent,
        "areaGuide": List<dynamic>.from(areaGuide.map((x) => x.toJson())),
        "areaGuideImg64": List<dynamic>.from(areaGuideImg64.map((x) => x)),
        "areaGuideVideoUrl": areaGuideVideoUrl,
      };
}

class AreaGuide {
  AreaGuide({
    required this.id,
    required this.sector,
    required this.city,
    required this.description,
    required this.images,
    required this.video,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String sector;
  String city;
  String description;
  String images;
  String video;
  DateTime createdAt;
  DateTime updatedAt;

  factory AreaGuide.fromJson(Map<String, dynamic> json) => AreaGuide(
        id: json["id"],
        sector: json["sector"],
        city: json["city"],
        description: json["description"],
        images: json["images"],
        video: json["video"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sector": sector,
        "city": city,
        "description": description,
        "images": images,
        "video": video,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
