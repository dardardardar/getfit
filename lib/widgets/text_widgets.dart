import 'package:flutter/material.dart';
import '../widgets/colors.dart';

Widget textTitle(String text){
  return  Text(
    text ,style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: LibColors.primary_color
    ),
  );
}