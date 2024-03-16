import 'package:erm/Pages/riskRegister/widgets/overall_risk_analysis.dart';
import 'package:erm/Pages/riskRegister/widgets/risk_by_division/risk_by_division.dart';
import 'package:erm/Pages/riskRegister/widgets/risk_reports/risk_reports.dart';
import 'package:erm/Pages/riskRegister/widgets/risks_table.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:erm/Pages/riskRegister/widgets/heat_map.dart';
import 'package:flutter/material.dart';

class RiskRegisterMainContent extends StatelessWidget {
  RiskRegisterMainContent({super.key});

  final List<Map<String, String>> _data = [
    {
      "RiskID": "RI10021",
      "Priority": "0",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Olivia Davis"
    },
    {
      "RiskID": "RI10321",
      "Priority": "1",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Becky Dawn"
    },
    {
      "RiskID": "RI15021",
      "Priority": "2",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Lenny Browski"
    },
    {
      "RiskID": "RI10021",
      "Priority": "0",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Olivia Davis"
    },
    {
      "RiskID": "RI10321",
      "Priority": "1",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Becky Dawn"
    },
    {
      "RiskID": "RI15021",
      "Priority": "2",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Lenny Browski"
    },
    {
      "RiskID": "RI10021",
      "Priority": "0",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Olivia Davis"
    },
    {
      "RiskID": "RI10321",
      "Priority": "1",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Becky Dawn"
    },
    {
      "RiskID": "RI15021",
      "Priority": "2",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Lenny Browski"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(4)),
          width: MediaQuery.of(context).size.width - 500,
          child: Card(
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Risks',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 196,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.grey.shade600,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey.shade600,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.grey.shade600,
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.grey.shade600,
                            ),
                            const DropDownListTile()
                          ],
                        ),
                      )
                    ],
                  ),
                  RisksTable(data: _data),
                ],
              ),
            ),
          ),
        ),
        const Column(
          children: [
            OverallRiskAnalysis(),
            SizedBox(
              height: 10,
            ),
            HeatMap(
              heading: 'RESIDUAL HEAT MAP',
            ),
            SizedBox(
              height: 10,
            ),
            RiskByDivision(),
            SizedBox(
              height: 10,
            ),
            RiskReports(
              widgetHeader: 'REPORTS',
            ),
            SizedBox(
              height: 40,
            ),
            RiskReports(
              widgetHeader: 'SUPPORTING DOCUMENTS',
            ),
            SizedBox(
              height: 40,
            ),
            RiskReports(
              widgetHeader: 'HELP MANUAL',
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
