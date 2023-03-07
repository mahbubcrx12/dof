import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


showInToast(String title) {

  return Fluttertoast.showToast(
      msg: "$title",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,

  );
}
