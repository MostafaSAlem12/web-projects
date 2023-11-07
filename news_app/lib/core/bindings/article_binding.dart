import 'package:get/get.dart';
import 'package:news_app/controllers/article/article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleController());
  }
}
