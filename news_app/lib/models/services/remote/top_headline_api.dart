
import 'package:get/get.dart';
import 'package:news_app/core/constants/urls.dart';
import 'package:news_app/models/models/article.dart';

class TopHeadlineApi extends GetConnect {
  final int pageSize = 20;
  Future<List<Article>> getArticles({int page = 1}) async {
    try {
      final Response<dynamic> response =
          await get<dynamic>(Url.topHeadlines, query: {
        "apiKey": Url.apiKey,
        // "country": "eg",
      });
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Something went wrong');
      }
      // final List<Map<String, dynamic>> data =
      //     jsonDecode(response.body)["articles"];
      // final List<Article> articles =
      //     data.map((article) => Article.fromJson(article)).toList();
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
