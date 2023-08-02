import 'dart:ffi';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showmessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static showsnackmessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.amber, content: Text(message)));
  }

  static void FlushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.bounceOut,
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(25),
          icon: Icon(Icons.error, size: 25),
          positionOffset: 20,
          duration: Duration(seconds: 3),
        )..show(context));
  }
}
