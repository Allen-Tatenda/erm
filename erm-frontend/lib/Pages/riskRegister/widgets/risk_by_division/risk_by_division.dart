import 'package:erm/Pages/riskRegister/widgets/risk_by_division/risk_progress_bar.dart';
import 'package:flutter/material.dart';

class RiskByDivision extends StatelessWidget {
  const RiskByDivision({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      width: 420,
      child: const Column(
        children: [
          Text('RISKs BY DIVISION'),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    'data',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                  width: 90,
                ),
                SizedBox(width: 420 - 150, child: RiskProgressBar()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
