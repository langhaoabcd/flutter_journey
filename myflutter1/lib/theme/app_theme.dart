// 深色主题
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: 'NotoSansSc', //全局指定字体
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  // fontFamily: GoogleFonts.getFont('NotoSansSc').fontFamily, //.PingFangSC(), //'Hind',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14),
  ),
);

// 浅色主题
final ThemeData lightTheme = ThemeData(
  fontFamily: 'NotoSansSc', //默认字体
  brightness: Brightness.light,
  primaryColor: Colors.white,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14),
  ),
);
