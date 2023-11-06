import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/core/routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        primarySwatch: Colors.red,
      ),
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
    );
  }
}
