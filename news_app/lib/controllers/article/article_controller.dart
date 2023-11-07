import 'package:get/get.dart';
import 'package:linkify/linkify.dart';
import 'package:news_app/models/models/article.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleController extends GetxController {
  final Article _article = Get.arguments["article"] as Article;
  Article get article => _article;
  final int _index = Get.arguments["index"] as int;
  int get index => _index;

  void onOpen(LinkableElement link) async {
    await launchUrlString(link.url);
  }
}
