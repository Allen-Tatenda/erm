import 'package:flutter/material.dart';

class RiskNavInfo extends StatelessWidget {
  const RiskNavInfo({
    super.key,
    required this.header,
    required this.value,
    required this.trailing,
  });

  final String header;
  final String value;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, widget) {
      var width = MediaQuery.of(context).size.width;
      if (width < 672) {
return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            header,
            style: const TextStyle(
                fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                    fontSize: 40),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                trailing,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
      }
      return SizedBox(
      width: (MediaQuery.of(context).size.width / 6) - 14,
      child: Column(
        children: [
          Text(
            header,
            style: const TextStyle(
                fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                    fontSize: MediaQuery.of(context).size.width / 23),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                trailing,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
      });
    
  }
}
