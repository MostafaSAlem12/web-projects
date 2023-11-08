import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/themes/themes.dart';

class ThemeController extends GetxController {
  void setThemeMode(ThemeMode mode) {
    AppThemes.setTheme(mode);
    Get.changeThemeMode(mode);
    update();
  }
}
