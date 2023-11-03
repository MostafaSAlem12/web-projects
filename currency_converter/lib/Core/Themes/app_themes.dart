import 'package:flutter/material.dart';

class AppThemes {
  static ThemeMode _mode = ThemeMode.system;
  static ThemeMode get mode => _mode;
  static final ThemeData light = ThemeData(
    primarySwatch: Colors.purple,
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData(
    primarySwatch: Colors.indigo,
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
  );

  static void setMode(ThemeMode mode) => _mode = mode;
}
