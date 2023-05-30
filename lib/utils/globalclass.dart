import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalClass {
  static String Price(String? str) {
    if (str == 'null')
      return "";
    else if (str!.length > 7)
      return str.toString().substring(0, 7) + "";
    else
      return str.toString();
  }

  static void showToast(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: color,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1);
  }
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
