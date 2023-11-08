import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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

  static bool isDarkTheme = false;

  AppThemes.initialize() {
    final String themeModeData = GetStorage().read<String>('theme') ?? 'system';
    isDarkTheme = GetStorage().read<bool>('isDarkTheme') ?? false;
    print(themeModeData);
    themeMode = ThemeMode.values.byName(themeModeData);
  }

  static void setTheme(ThemeMode mode) {
    themeMode = mode;
    GetStorage().write('theme', mode.name);
  }

  static void setDarkTheme(bool isDark) {
    isDarkTheme = isDark;
    GetStorage().write('isDarkTheme', isDark);
  }
}
