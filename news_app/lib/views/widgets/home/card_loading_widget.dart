import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoadingWidget extends StatelessWidget {
  const CardLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        child: const SizedBox(
          height: 180,
          child: Card(),
        ),
      ),
    );
  }
}
