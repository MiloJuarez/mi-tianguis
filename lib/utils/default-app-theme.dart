import 'package:flutter/material.dart';

class DefaultAppTheme {
  static ThemeData get() {
    return ThemeData(
      primaryColor: Color.fromRGBO(0, 153, 92, 1),
      fontFamily: "CaveatRegular",
      hoverColor: Colors.white,
      splashColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(0, 153, 92, 1),
            elevation: 0.8,
            alignment: Alignment.center,
            shadowColor: Colors.black38),
      ),
    );
  }
}
