import 'package:flutter/material.dart';

//colors
// ignore: non_constant_identifier_names
final coursehub_skyblue = Color(0xFFA1CCF7);
// ignore: non_constant_identifier_names
final coursehub_red = Color(0xFFE68688);
// ignore: non_constant_identifier_names
final coursehub_puple = Color(0xFFBAC2F6);
// ignore: non_constant_identifier_names
final coursehub_blue = Color(0xFF1A72FF);
// ignore: non_constant_identifier_names
final coursehub_aquablue = Color(0xFF8EE7EB);
// ignore: non_constant_identifier_names
final coursehub_grey = Color(0xFFCDCED0);

final labelStyle = TextStyle(
  color: Colors.grey,
);
final hintStyle = TextStyle(
  color: Colors.black,
);
final blueButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
final blueTextStyle = TextStyle(
  color: coursehub_blue,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

final textBorderColor = coursehub_blue;
final containerDecoration = BoxDecoration(
  color: Color(0xFFEBEAF2),
  border: Border.all(
    color: textBorderColor,
  ),
  borderRadius: BorderRadius.circular(
    5.0,
  ),
);
final containerPadding = EdgeInsets.symmetric(
  horizontal: 4.0,
);
