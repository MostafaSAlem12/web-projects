import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/themes/theme_controller.dart';
import 'package:news_app/core/themes/themes.dart';

class SettingsController extends GetxController {
  final ThemeController themeController = Get.find<ThemeController>();
  //Theme
  bool _isSystemTheme = AppThemes.themeMode == ThemeMode.system;
  bool get isSystemTheme => _isSystemTheme;
  bool _isDarkMode = AppThemes.isDarkTheme;
  bool get isDarkMode => _isDarkMode;

  //Locale
  bool _isSystemLocale = true;
  bool get isSystemLocale => _isSystemLocale;
  final List<String> _locales = ['en', 'ar'];
  List<String> get locales => _locales;
  String _selectedLocale = 'en';
  String get selectedLocale => _selectedLocale;

  //Region
  bool _isSystemRegion = true;
  bool get isSystemRegion => _isSystemRegion;
  final List<String> _regions = ['us', 'eg'];
  List<String> get regions => _regions;
  String _selectedRegion = 'us';
  String get selectedRegion => _selectedRegion;

  void toggleSystemTheme(bool _) {
    _isSystemTheme = !_isSystemTheme;
    if (_isSystemTheme) {
      themeController.setThemeMode(ThemeMode.system);
    } else {
      if (_isDarkMode) {
        themeController.setThemeMode(ThemeMode.dark);
      } else {
        themeController.setThemeMode(ThemeMode.light);
      }
    }
    update();
  }

  void toggleSystemLocale(bool _) {
    _isSystemLocale = !_isSystemLocale;
    update();
  }

  void toggleSystemRegion(bool _) {
    _isSystemRegion = !_isSystemRegion;
    update();
  }

  void toggleDarkMode(bool _) {
    _isDarkMode = !_isDarkMode;
    if (_isDarkMode) {
      themeController.setThemeMode(ThemeMode.dark);
    } else {
      themeController.setThemeMode(ThemeMode.light);
    }
    AppThemes.setDarkTheme(_isDarkMode);
    update();
  }

  void selectLocale(String? locale) {
    _selectedLocale = locale!;
    update();
  }

  void selectRegion(String? region) {
    _selectedRegion = region!;
    update();
  }
}
