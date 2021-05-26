import 'package:avecgroupapp/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  canvasColor: Colors.white,
  primaryColor: themeBlueGreen,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: globalPurple,
      ),
    ),
    fillColor: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: subGrey,
  ),
  fontFamily: "Gilroy",
  textTheme: TextTheme(
    headline3: TextStyle(
      color: Colors.black,
    ),
    headline4: TextStyle(
      color: subGrey,
    ),
    headline5: TextStyle(color: Colors.black, fontFamily: "Roboto Medium"),
    subtitle1: TextStyle(color: subGrey, fontFamily: "Roboto"),
    bodyText1: TextStyle(color: themeBlueGreen, fontFamily: "Roboto Bold"),
    bodyText2: TextStyle(color: subGrey, fontFamily: "Roboto"),
    caption: TextStyle(color: Colors.white),
  ),
);
ThemeData darkTheme = ThemeData(
  canvasColor: canvasColor,
  primaryColor: themeBlueGreen,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: globalPurple,
      ),
    ),
    fillColor: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: subGrey,
  ),
  fontFamily: "Gilroy",
  textTheme: TextTheme(
    headline3: TextStyle(
      color: themeBlueGreen,
    ),
    headline4: TextStyle(
      color: subGrey,
    ),
    headline5: TextStyle(color: Colors.white, fontFamily: "Roboto Medium"),
    subtitle1: TextStyle(color: themeBlueGreen, fontFamily: "Roboto"),
    bodyText1: TextStyle(color: themeBlueGreen, fontFamily: "Roboto Bold"),
    bodyText2: TextStyle(color: subGrey, fontFamily: "Roboto"),
    caption: TextStyle(color: Colors.white),
  ),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
  static SharedPreferences? preferences;
  static bool? _isDarkTheme;

  bool? get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    _isDarkTheme = false;
    _loadPrefs();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme!;
    _savePrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (preferences == null)
      preferences = await SharedPreferences.getInstance();
  }

  _loadPrefs() async {
    await _initPrefs();
    _isDarkTheme = preferences!.getBool(key) ?? false;
    notifyListeners();
  }

  _savePrefs() async {
    await _initPrefs();
    preferences!.setBool(key, _isDarkTheme!);
  }
}
