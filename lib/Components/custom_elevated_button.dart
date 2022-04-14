import 'package:arzenafees/Components/Constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {required this.onPressed, required this.child, Key? key})
      : super(key: key);

  final Function()? onPressed;
  final Widget child;
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
      child: child,
      onPressed: onPressed,
    );
  }
}
