// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Arz e Nafees", style: TextStyle(fontFamily: 'Roboto'))),
      body: Center(
          child: Text("Arz e Nafees Home",
              textScaleFactor: 2, style: TextStyle(fontFamily: 'Roboto'))),
    );
  }
}
