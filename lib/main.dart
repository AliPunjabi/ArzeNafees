import 'dart:async';
import 'package:arzenafees/Components/Constants.dart';
import 'package:arzenafees/Components/transitions.dart';
import 'package:arzenafees/Screens/homescreen.dart';
import 'package:arzenafees/Screens/loginscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Constants.colorMain,
          secondary: Constants.colorSecond,
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              Transitions(
                transitionType: TransitionType.fade,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000),
                reverseCurve: Curves.easeInOut,
                widget: LoginScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image.asset('assets/images/Splash screen.jpg'));
  }
}
