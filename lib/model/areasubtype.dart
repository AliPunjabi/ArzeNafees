// To parse this JSON data, do
//
//     final areasubtype = areasubtypeFromJson(jsonString);

import 'dart:convert';

List<Areasubtype> areaguideFromJson(String str) => List<Areasubtype>.from(
    json.decode(str).map((x) => Areasubtype.fromJson(x)));

String areaguideToJson(List<Areasubtype> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Areasubtype {
  Areasubtype({
    required this.success,
    required this.subtype,
  });

  bool success;
  List<Subtype> subtype;

  factory Areasubtype.fromJson(Map<String, dynamic> json) => Areasubtype(
        success: json["success"] ?? true,
        subtype:
            List<Subtype>.from(json["subtype"].map((x) => Subtype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "subtype": List<dynamic>.from(subtype.map((x) => x.toJson())),
      };
}

class Subtype {
  Subtype({
    required this.id,
    required this.name,
    required this.propertyType,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  PropertyType? propertyType;
  dynamic createdAt;
  dynamic updatedAt;

  factory Subtype.fromJson(Map<String, dynamic> json) => Subtype(
        id: json["id"],
        name: json["name"],
        propertyType: propertyTypeValues.map![json["property_type"]],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "property_type": propertyTypeValues.reverse![propertyType],
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

enum PropertyType { RESIDENTIAL }

final propertyTypeValues =
    EnumValues({"residential": PropertyType.RESIDENTIAL});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
