import 'package:flutter/material.dart';

class ArticleCardWidget extends StatelessWidget {
  final String title;
  final String? content;
  final String? heroTag;
  final Widget? contentWidget;
  const ArticleCardWidget({
    super.key,
    required this.title,
    this.content,
    this.contentWidget,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (contentWidget != null)
              contentWidget!
            else if (content != null)
              if (heroTag == null)
                Text(
                  content!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              else
                Hero(
                  tag: heroTag!,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      content!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
