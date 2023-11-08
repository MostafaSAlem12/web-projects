import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/home/top_headline_controller.dart';
import 'package:news_app/core/utils/enums/status.dart';
import 'package:news_app/models/models/article.dart';
import 'package:news_app/views/widgets/home/card_loading_widget.dart';
import 'package:news_app/views/widgets/home/page_loading_widget.dart';
import 'package:news_app/views/widgets/home/top-headline/empty_topheadline_widget.dart';

import '../../../widgets/article_widget.dart';

class TopHeadlineTab extends StatelessWidget {
  const TopHeadlineTab({super.key});

  @override
  Widget build(BuildContext context) {
    const EdgeInsetsGeometry padding = EdgeInsets.all(15);
    return GetBuilder<TopHeadlineController>(
      init: Get.find<TopHeadlineController>(),
      builder: (controller) {
        switch (controller.status) {
          case Status.success:
            if (controller.articles.isNotEmpty) {
              return ListView(
                key: controller.storageKey,
                padding: padding,
                controller: controller.listController,
                children: [
                  const Text(
                    'Breaking',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.articles.length + 1,
                      itemBuilder: (context, index) {
                        if (index == controller.articles.length) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'End of results',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        final Article article = controller.articles[index];
                        return ArticleWidget(
                          article: article,
                          index: index,
                          onTap: () {
                            controller.toArticlePage(index);
                          },
                        );
                      }),
                ],
              );
            } else {
              return const EmptyTopHeadlineWidget();
            }
          case Status.loading:
            if (controller.articles.isNotEmpty) {
              return ListView(
                key: controller.storageKey,
                padding: padding,
                controller: controller.listController,
                children: [
                  const Text(
                    'Breaking',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.articles.length + 1,
                    itemBuilder: (context, index) {
                      if (index == controller.articles.length &&
                          controller.status == Status.loading) {
                        return const CardLoadingWidget();
                      }
                      final Article article = controller.articles[index];
                      return ArticleWidget(
                        article: article,
                        index: index,
                        onTap: () {
                          controller.toArticlePage(index);
                        },
                      );
                    },
                  ),
                ],
              );
            } else {
              return const PageLoadingWidget(
                padding: padding,
              );
            }
          default:
            return const EmptyTopHeadlineWidget();
        }
      },
    );
  }
}
