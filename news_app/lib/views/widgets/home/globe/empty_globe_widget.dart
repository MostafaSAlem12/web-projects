import 'package:flutter/material.dart';
import 'package:news_app/core/constants/images.dart';

class EmptyGlobeWidget extends StatelessWidget {
  const EmptyGlobeWidget({super.key});

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
              Images.globe,
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
