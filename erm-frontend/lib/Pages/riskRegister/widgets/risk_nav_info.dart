import 'package:flutter/material.dart';

class RiskNavInfo extends StatelessWidget {
  RiskNavInfo({
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
    return Container(
      width: (MediaQuery.of(context).size.width / 6) - 14,
      child: Column(
        children: [
          Text(
            header,
            style: TextStyle(
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
              SizedBox(
                width: 4,
              ),
              Text(
                trailing,
                style: TextStyle(
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
}
