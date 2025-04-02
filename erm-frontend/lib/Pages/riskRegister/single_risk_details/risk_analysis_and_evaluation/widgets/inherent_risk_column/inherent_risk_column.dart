// import 'package:erm/Pages/riskRegister/single_risk_details/risk_analysis_and_evaluation/widgets/inherent_risk_column/risk_response.dart';
// import 'package:erm/Pages/riskRegister/widgets/heat_map.dart';
// import 'package:flutter/material.dart';

// class InherentRiskColumn extends StatelessWidget {
//   InherentRiskColumn({super.key});

//   final List<Map<String, String>> data = [
//     {
//       "name": "liquidity Risk",
//       "description":
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//     },
//     {
//       "name": "Decreased Productivity",
//       "description":
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//     },
//     {
//       "name": "Inreased Costs",
//       "description":
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//           width: (MediaQuery.of(context).size.width / 3) - 36,
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             const HeatMap(
//               heading: 'INHERENT RISK',
//             ),
//             RiskResponseWidget(data: data)
//           ])),
//     );
//   }
// }
