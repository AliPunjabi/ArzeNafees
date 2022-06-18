import 'dart:convert';

import 'package:arzenafees/model/areaview.dart';
import 'package:http/http.dart' as http;

Future<List<Areaview>?> fetcharea() async {
  final response = await http.get(
      Uri.parse('https://arz-e-nafees.nafeessolutions.com/public/api/view'));
  if (response.statusCode == 200) {
    List<Areaview> property = (json.decode(response.body))
        .map<Areaview>((m) => Areaview.fromJson(m))
        .toList();
    return property;
  } else {
    throw Exception('Unexpected error occured!');
  }
}
