// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:arzenafees/Components/Constants.dart';
import 'package:arzenafees/model/areaview.dart';
import 'package:arzenafees/services/areaviewapi.dart';
import 'package:flutter/material.dart';

class VerticalCards extends StatelessWidget {
  List<Property> areaData;
  VerticalCards(this.areaData);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Constants.colorSecond),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: areaData.length,
        itemBuilder: (context, index) {
          final String? image = areaData[index].propertyImage.toString();

          return Container(
              // width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SizedBox(
                  width: 300,
                  height: 180,
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(alignment: Alignment.bottomLeft, children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://arz-e-nafees.nafeessolutions.com" +
                                    "$image"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ]),
                  )),
            ),
          ));
        },
      ),
    );
  }
}
