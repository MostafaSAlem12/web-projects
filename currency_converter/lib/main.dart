import 'package:currency_converter/Controller/main_screen_controller.dart';
import 'package:currency_converter/Core/Themes/app_themes.dart';
import 'package:currency_converter/View/Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: AppThemes.mode,
      home: ChangeNotifierProvider.value(
        value: MainScreenController(),
        child: const MainScreen(),
      ),
    );
  }
}
