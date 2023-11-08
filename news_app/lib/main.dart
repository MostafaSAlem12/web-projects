import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/core/routes/pages.dart';
import 'package:news_app/core/themes/theme_controller.dart';
import 'package:news_app/core/themes/themes.dart';
import 'package:news_app/core/utils/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AppServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      themeMode: AppThemes.themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
    );
  }
}
