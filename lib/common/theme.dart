import 'package:flutter/material.dart';

class ThemeDataList {
  // App theme
  static final appbartheme = Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [Colors.black, Colors.blueGrey]),
    ),
  );
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static final apptext = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static final authfield =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
  static final hinttext = TextStyle(color: Colors.grey);
  static final requiredfield = TextStyle(color: Colors.red, fontSize: 20);
  static final gradientColor = [Colors.black, Colors.blueGrey];
  static final transparentColor = Colors.transparent;
  static final errorColor = const Color.fromARGB(255, 190, 50, 40);

  // Screen 1
  static final Shader linearGradient =
      LinearGradient(colors: [Colors.black, Colors.blueGrey])
          .createShader(const Rect.fromLTWH(0, 0, 200, 70));
  static final style = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    foreground: Paint()..shader = linearGradient,
  );
  static final textalign = TextAlign.center;
  static final decoration = Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(32),
      gradient: LinearGradient(colors: [Colors.black, Colors.blueGrey]),
    ),
  );
  static final buttonstyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, shadowColor: Colors.transparent);
  static final buttontextstyle =
      TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold);
}
