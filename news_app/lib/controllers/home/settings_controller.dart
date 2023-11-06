import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingsController extends GetxController {
  //Theme
  bool _isSystemTheme = true;
  bool get isSystemTheme => _isSystemTheme;
  bool _isDarkMode = false;
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
