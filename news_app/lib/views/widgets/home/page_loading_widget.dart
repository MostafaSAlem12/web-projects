import 'package:flutter/material.dart';
import 'package:news_app/views/widgets/home/card_loading_widget.dart';

class PageLoadingWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const PageLoadingWidget({super.key, required this.padding});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      itemCount: 20,
      itemBuilder: (context, index) => const CardLoadingWidget(),
    );
  }
}
