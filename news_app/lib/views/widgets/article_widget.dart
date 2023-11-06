import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/core/utils/date/date_calculator.dart';
import 'package:news_app/models/models/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  final int index;
  final void Function()? onTap;
  const ArticleWidget({
    super.key,
    required this.article,
    this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            if (article.urlToImage != null)
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                    tag: '$index${article.urlToImage!}',
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage!,
                      fit: BoxFit.cover,
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
                ),
              ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Hero(
                      tag: '$index${article.title!}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          article.title!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    subtitle: article.description != null
                        ? Hero(
                            tag: '$index${article.description!}',
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                article.description!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        : null,
                  ),
                  ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: '$index${article.author!}',
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              'Written By: ${article.author}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        if (article.source != null)
                          Hero(
                            tag: '$index${article.source!}',
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                'Source: ${article.source!.name}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    subtitle: Hero(
                      tag: '$index${article.publishedAt!}',
                      child: Opacity(
                        opacity: 0.5,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            'Published: ${DateCalculator.calculateTime(article.publishedAt!)}',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
