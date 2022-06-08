import 'dart:convert';
import 'package:arzenafees/model/areaguide.dart';
import 'package:http/http.dart' as http;

Future<Areaguide> fetcharea() async {
  final response = await http.get(
      Uri.parse('https://arz-e-nafees.nafeessolutions.com/public/api/view'));
  if (response.statusCode == 200) {
    return Areaguide.fromJson(jsonDecode(response.body)[0]);
  } else {
    throw Exception('Unexpected error occured!');
  }
}
