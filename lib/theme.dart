import 'package:flutter/material.dart';

final theme = ThemeData(
  iconTheme: IconThemeData(
    color: Colors.white,
    size: 16,
  ),
  fontFamily: 'Verdana',
  primaryColor: const Color(0xFFDEDEE3),
  highlightColor: const Color(0xFF1C213E),
  backgroundColor: const Color(0xFF050B2C),
  scaffoldBackgroundColor: const Color(0xFF050B2C),
  accentColor: const Color(0x1C213E),
  toggleableActiveColor: const Color(0xFF1E4F63),
  splashColor: const Color(0xFFFDB223),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontFamily: 'Verdana', fontSize: 10, color: Color(0xFFDEDEE3)),
    bodyText2: TextStyle(
        fontFamily: 'Verdana', fontSize: 10, color: Color(0xFF050B2C)),
    headline5: TextStyle(
        fontFamily: 'Varela Round', color: Color(0xFFDEDEE3), fontSize: 16),
    headline6: TextStyle(
        fontFamily: 'Verdana', fontSize: 16, color: Color(0xFFDEDEE3)),
    headline4: TextStyle(
        fontFamily: 'Verdana', color: Color(0xFFFFFFFF), fontSize: 14),
    headline3:
        TextStyle(fontFamily: 'Verdana', color: Colors.white24, fontSize: 14),
    headline2: TextStyle(
        fontFamily: 'DIN Alternate', color: Colors.white24, fontSize: 19),
    headline1: TextStyle(
        fontFamily: 'DIN Alternate', color: Colors.white24, fontSize: 11),
    subtitle1: TextStyle(
        fontFamily: 'DIN Alternate', color: Colors.white24, fontSize: 45),
    subtitle2: TextStyle(
        fontFamily: 'DIN Alternate', color: Colors.white24, fontSize: 21),
  ),
);
