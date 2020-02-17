import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChazzToast {
  static void show(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
