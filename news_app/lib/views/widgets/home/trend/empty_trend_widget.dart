import 'package:flutter/material.dart';
import 'package:news_app/core/constants/images.dart';

class EmptyTrendWidget extends StatelessWidget {
  const EmptyTrendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 4 / 1,
          child: Opacity(
            opacity: 0.6,
            child: Image.asset(
              Images.trend,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Nothing to show',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
