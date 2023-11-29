import 'package:flutter/material.dart';

enum MyTheme { light, dark }

class ThemeState with ChangeNotifier {
  static List<ThemeData> themes = [
    ThemeData(
        colorScheme: const ColorScheme(
            primary: Colors.redAccent, //上方标题栏颜色
            primaryVariant: Colors.white,
            secondary: Colors.green,
            background: Colors.white,
            error: Colors.red,
            brightness: Brightness.light,
            onBackground: Colors.pink,
            secondaryVariant: Colors.white,
            onError: Colors.yellow,
            onPrimary: Colors.white, //字体颜色
            onSecondary: Colors.redAccent,
            onSurface: Colors.redAccent,
            surface: Colors.redAccent
            // all fields should have a value
            )),
    ThemeData(
        colorScheme: const ColorScheme(
            primary: Colors.redAccent, //上方标题栏颜色
            primaryVariant: Colors.white,
            secondary: Colors.green,
            background: Colors.white,
            error: Colors.red,
            brightness: Brightness.dark,
            onBackground: Colors.pink,
            secondaryVariant: Colors.white,
            onError: Colors.yellow,
            onPrimary: Colors.white, //字体颜色
            onSecondary: Colors.redAccent,
            onSurface: Colors.redAccent,
            surface: Colors.redAccent
            // all fields should have a value
            )),
  ];

  MyTheme _currentTheme = MyTheme.dark;
  ThemeData _currentThemeData = themes[1];

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
