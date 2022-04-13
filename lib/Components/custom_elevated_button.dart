import 'package:arzenafees/Components/Constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {required this.buttonLabel, required this.onPressed, Key? key})
      : super(key: key);
  final String buttonLabel;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Constants.colorMain,
        onPrimary: Constants.colorSecond,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
            fontFamily: Constants.appFont,
            fontWeight: FontWeight.w900,
            color: Constants.colorSecond,
            fontSize: 16.0),
      ),
      onPressed: onPressed,
    );
  }
}
