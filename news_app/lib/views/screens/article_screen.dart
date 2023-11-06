import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/controllers/article/article_controller.dart';
import 'package:news_app/core/utils/date/date_calculator.dart';
import 'package:news_app/views/widgets/article/article_card_widget.dart';
import 'package:readmore/readmore.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleController>(builder: (controller) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: controller.article.urlToImage != null
                  ? FlexibleSpaceBar(
                      title: Hero(
                        tag: '${controller.index}${controller.article.title!}',
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            controller.article.title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      background: Stack(
                        children: [
                          // Container(
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: CachedNetworkImageProvider(
                          //       controller.article.urlToImage!,
                          //     )),
                          //   ),
                          Hero(
                            tag:
                                '${controller.index}${controller.article.urlToImage!}',
                            child: CachedNetworkImage(
                              imageUrl: controller.article.urlToImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              placeholder: (context, url) {
                                return const Center(
                                  child: SpinKitCircle(
                                    color: Colors.redAccent,
                                    duration: Duration(milliseconds: 2400),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return const Center(
                                  child: Icon(
                                    Ionicons.images_outline,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),

                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if (controller.article.description != null)
                      ArticleCardWidget(
                        title: 'Description',
                        content: controller.article.description!,
                        heroTag:
                            '${controller.index}${controller.article.description!}',
                      ),
                    if (controller.article.content != null)
                      ArticleCardWidget(
                        title: 'Content',
                        contentWidget: ReadMoreText(
                          controller.article.content!,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    if (controller.article.author != null)
                      ArticleCardWidget(
                        title: 'Author',
                        content: controller.article.author,
                        heroTag:
                            '${controller.index}${controller.article.author}',
                      ),
                    if (controller.article.source != null)
                      ArticleCardWidget(
                        title: 'Source',
                        content: controller.article.source!.name!,
                        heroTag:
                            '${controller.index}${controller.article.source!}',
                      ),
                    if (controller.article.url != null)
                      ArticleCardWidget(
                        title: 'Article link',
                        contentWidget: Linkify(
                          text: controller.article.url!,
                          onOpen: controller.onOpen,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    if (controller.article.publishedAt != null)
                      ArticleCardWidget(
                        title: 'Published',
                        content: DateCalculator.calculateTime(
                          controller.article.publishedAt!,
                        ),
                        heroTag:
                            '${controller.index}${controller.article.publishedAt!}',
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
