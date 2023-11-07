import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/routes/routes.dart';
import 'package:news_app/core/utils/enums/status.dart';
import 'package:news_app/models/models/article.dart';
import 'package:news_app/models/services/testing/top_headline_dummy.dart';

import '../../models/services/remote/top_headline_api.dart';

class TopHeadlineController extends GetxController {
  Status _status = Status.loading;
  String _error = '';
  String get error => _error;
  Status get status => _status;
  final TopHeadlineApi _api = TopHeadlineApi();
  int _page = 1;
  int get page => _page;
  final List<Article> _articles = [];
  List<Article> get articles => _articles;

  final ScrollController listController = ScrollController();
  final PageStorageKey storageKey = const PageStorageKey('top-headline');

  @override
  void onReady() {
    getArticles();
    super.onReady();
  }

  void toArticlePage(int index) {
    Article article = _articles[index];
    Get.toNamed(
      AppRoutes.article,
      arguments: {"article": article, "index": index},
    );
  }

  Future<void> getArticles() async {
    try {
      _status = Status.loading;
      update();
      final List<Article> articles = await _api.getArticles(page: page);
      _articles.addAll(articles);
      _status = Status.success;
      _page++;
      update();
    } on Exception catch (e) {
      await getCachedArticles();
      if (articles.isNotEmpty) return;
      _error = e.toString().substring(10).trim();
      _status = Status.error;
      update();
    }
  }

  Future<void> getCachedArticles() async {
    try {
      _status = Status.loading;
      update();
      final List<Article> articles =
          TopHeadlineDummy.articlesUs.map((e) => Article.fromJson(e)).toList();
      _articles.addAll(articles);
      _status = Status.success;
      _page++;
      update();
    } on Exception catch (e) {
      _error = e.toString().substring(10).trim();
      _status = Status.error;
      update();
    }
  }
}
