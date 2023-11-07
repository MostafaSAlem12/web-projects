import 'package:flutter/material.dart';

class AppThemes {
  static ThemeMode themeMode = ThemeMode.system;
  static set setThemeMode(ThemeMode mode) => themeMode = mode;
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    primarySwatch: Colors.red,
    brightness: Brightness.light,
    // colorScheme: ColorScheme.fromSwatch(
    //   brightness: Brightness.light,
    // ),
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
    // colorScheme: ColorScheme.fromSwatch(
    //   brightness: Brightness.dark,
    // ),
  );
}
