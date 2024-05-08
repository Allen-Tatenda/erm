import 'package:flutter/material.dart';

class RiskInfoSubHeadingAndText extends StatelessWidget {
  const RiskInfoSubHeadingAndText({
    super.key,
    required this.subheading,
    required this.text,
  });

  final String subheading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          subheading,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        )
      ]),
    );
  }
}
