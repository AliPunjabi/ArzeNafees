import 'dart:convert';

import 'package:arzenafees/model/areaview.dart';
import 'package:http/http.dart' as http;

//List<Property>? areaview;
Future fetcharea() async {
  final response = await http.get(
      Uri.parse('https://arz-e-nafees.nafeessolutions.com/public/api/view'));
  if (response.statusCode == 200) {
    return areaviewFromJson(response.body).properties;
    // var property = (json.decode(response.body));
    // Areaview viewarea = Areaview.fromJson(property);
    //areaview = viewarea.properties;
    //return property;
  } else {
    throw Exception('Unexpected error occured!');
  }
}
