import 'dart:convert';
import 'package:arzenafees/model/addproperty.dart';
import 'package:http/http.dart' as http;

Future<Addproperty> addproperty(String category, title, type, subtype, city,
    area, size, unit, price, description, image, contact) async {
  final response = await http.post(
    Uri.parse('https://arz-e-nafees.nafeessolutions.com/public/api/store'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Charset': 'utf-8',
    },
    body: jsonEncode(<String, dynamic>{
      'property_category': category,
      'property_title': title,
      'property_type': type,
      'property_subtype': subtype,
      'location_city': city,
      'location_area': area,
      'size': size,
      'unit': unit,
      'property_price': price,
      'property_description': description,
      'property_image': image,
      'contact_number': contact,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Addproperty.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to add property.');
  }
}
