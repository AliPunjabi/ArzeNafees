import 'dart:convert';

import 'package:arzenafees/model/areaguide.dart';
import 'package:arzenafees/model/areaview.dart';
import 'package:http/http.dart' as http;

List<AreaGuide>? areaguide;
Future<void> fetchareaguide() async {
  final response = await http.get(Uri.parse(
      'https://arz-e-nafees.nafeessolutions.com/public/api/ApiAreaGuide?area=G-13&city=Islamabad'));
  if (response.statusCode == 200) {
    var guide = (json.decode(response.body));
    Areaguide guidearea = Areaguide.fromJson(guide);
    areaguide = guidearea.areaGuide;
    return guide;
  } else {
    throw Exception('Unexpected error occured!');
  }
}
