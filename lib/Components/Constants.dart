import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static var kAppLabelWidget = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
      fontFamily: Constants.appFont,
      color: const Color(0xFF03041D));

  static Color colorMain = const Color(0xFFBC1022);
  static Color colorSecond = const Color(0xFFFFFFFF);
  static Color coloroffWhite = const Color(0xFFF9F9F9);
  static String appFont = 'Roboto';

  static var kTextFieldInputDecoration = InputDecoration(
    hintStyle: TextStyle(color: Colors.grey),
    errorStyle: TextStyle(fontFamily: Constants.appFont, color: Colors.red),
    filled: true,
    fillColor: Constants.colorSecond,
    contentPadding:
        const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0, right: 14),
    errorMaxLines: 2,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 0.5, color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 0.5, color: Colors.grey),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 0.5, color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 0.5, color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 0.5, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
  );
  static Future<bool> checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      Constants.toastMessage("No Internet Connection");
      return false;
    }
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Constants.colorSecond,
        fontSize: 16.0);
  }
}
