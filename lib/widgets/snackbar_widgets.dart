import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';


class SnackBarWidgets{

  static final snackKey = GlobalKey<ScaffoldMessengerState>();
  static fire(String? text){

    if(text == null) return;
    final snack = SnackBar(content: Text(text), backgroundColor: LibColors.danger_red,);
    snackKey.currentState!..removeCurrentSnackBar()..showSnackBar(snack);
  }
}