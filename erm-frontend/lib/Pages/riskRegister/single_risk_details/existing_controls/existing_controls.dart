import 'package:erm/Pages/riskRegister/single_risk_details/existing_controls/widgets/existing_controls_column/existing_contros_column.dart';
import 'package:erm/Pages/riskRegister/single_risk_details/existing_controls/widgets/residual_risk_column/residual_risk_column.dart';
import 'package:flutter/material.dart';


class ExistingControls extends StatelessWidget {
   ExistingControls({super.key});
    final List<Map<String, String>> data = [
    {
      "name": "liquidity Risk",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "owner": "Lorainne Max",
    "effectiveness": "Requires Improvement",
    "control_type": "Legal Control",
    },
    {
      "name": "Decreased Productivity",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "owner": "Lorainne Max",
    "effectiveness": "Requires Improvement",
    "control_type": "Legal Control",
    },
    {
      "name": "Inreased Costs",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "owner": "Lorainne Max",
    "effectiveness": "Requires Improvement",
    "control_type": "Legal Control",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExistingControlsColum(data: data),
              ResidualRiskColumn()
            ],
          )
        ],
      ),
    );
  }
}