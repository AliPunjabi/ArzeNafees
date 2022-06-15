import 'dart:convert';

import 'package:arzenafees/model/areaguide.dart';
import 'package:http/http.dart' as http;

Future<List<Areaguide>?> fetcharea() async {
  final response = await http.get(
      Uri.parse('https://arz-e-nafees.nafeessolutions.com/public/api/view'));
  if (response.statusCode == 200) {
    List<Areaguide> property = (json.decode(response.body))
        .map<Areaguide>((m) => Areaguide.fromJson(m))
        .toList();
    return property;
  } else {
    throw Exception('Unexpected error occured!');
  }
}
