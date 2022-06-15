import 'dart:convert';

import 'package:arzenafees/model/areasubtype.dart';
import 'package:http/http.dart' as http;

List<Subtype>? subtypes;

Future<void> fetchareasubtype(areasubtype) async {
  final response = await http.get(
    Uri.parse(
        'https://arz-e-nafees.nafeessolutions.com/public/api/SubtypeProperty?property_type=$areasubtype'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
  );
  if (response.statusCode == 200) {
    var map = (json.decode(response.body));
    Areasubtype areasubtype = Areasubtype.fromJson(map);
    subtypes = areasubtype.subtype;
  } else {
    throw Exception('Unexpected error occured!');
  }
}
