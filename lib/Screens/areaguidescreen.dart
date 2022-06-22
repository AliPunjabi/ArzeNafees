// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arzenafees/Components/Export/custom_import.dart';
import 'package:arzenafees/model/areaview.dart';
import 'package:arzenafees/services/areaguideapi.dart';

class areaguide extends StatelessWidget {
  final Property areaData;
  areaguide(this.areaData);

  @override
  Widget build(BuildContext context) {
    final String areaName = areaData.locationCity;
    final String areaSubtype = areaData.locationArea;
    return Scaffold(
        body: FutureBuilder(
      future: fetchareaguide(areaName, areaSubtype),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          final guide = (snapshot.data)['areaGuide'];
          final String sector = guide[0]['sector'];
          final String city = guide['city'];
          final String description = guide['description'];
          return guide;
        }
      },
    ));
  }
}
