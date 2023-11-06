import 'package:get/get.dart';
import 'package:news_app/core/routes/routes.dart';
import 'package:news_app/views/screens/home/home_screen.dart';

import '../../views/screens/article_screen.dart';
import '../bindings/article_binding.dart';
import '../bindings/home_binding.dart';

class AppPages {
  static const String initial = AppRoutes.home;
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.article,
      binding: ArticleBinding(),
      page: () => const ArticleScreen(),
    ),
  ];
}
