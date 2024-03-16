import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              width: 2,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade900,
              width: 3,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              width: 2,
            ),
          ),
        ],
      ),
    );
  }
}
