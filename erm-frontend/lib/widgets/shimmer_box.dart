import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBoxWidget extends StatelessWidget {
  const ShimmerBoxWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  const Color.fromARGB(8, 0, 0, 0),
      highlightColor: const Color.fromARGB(20, 0, 0, 0),
      child: Container(
        width: double.infinity,
        height: height,
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      )
    );
  }
}