import 'package:flutter/material.dart';

enum MyTheme { light, dark }

class ThemeState with ChangeNotifier {
  static List<ThemeData> themes = [
    ThemeData(
  fontFamily: 'NotoSansSc', //默认字体
  brightness: Brightness.light,
  primaryColor: Colors.white,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14),
  ),
),
    ThemeData(
  fontFamily: 'NotoSansSc', //全局指定字体
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  // fontFamily: GoogleFonts.getFont('NotoSansSc').fontFamily, //.PingFangSC(), //'Hind',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14),
  ),
)   
  ];

  MyTheme _currentTheme = MyTheme.light;
  ThemeData _currentThemeData = themes[0];

  void initTheme(MyTheme t) {
    if (t == MyTheme.dark) {
      _currentTheme = MyTheme.dark;
      _currentThemeData = themes[1];
    }
  }

  get getCurrentTheme => _currentTheme;
  get getCurrentThemeData => _currentThemeData;

  set setCurrentTheme(MyTheme t) {
    if (t != null) {
      _currentTheme = t;
      _currentThemeData =
          _currentTheme == MyTheme.light ? themes[0] : themes[1];
    }
    notifyListeners(); //重点！
  }

  void switchTheme() => getCurrentTheme == MyTheme.light
      ? setCurrentTheme = MyTheme.dark
      : setCurrentTheme = MyTheme.light;
}
