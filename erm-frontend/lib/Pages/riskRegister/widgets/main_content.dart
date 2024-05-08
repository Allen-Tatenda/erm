import 'package:erm/Pages/riskRegister/widgets/add_risk/add_risk.dart';
import 'package:erm/Pages/riskRegister/widgets/overall_risk_analysis.dart';
import 'package:erm/Pages/riskRegister/widgets/risk_by_division/risk_by_division.dart';
import 'package:erm/Pages/riskRegister/widgets/risk_reports/risk_reports.dart';
import 'package:erm/Pages/riskRegister/widgets/risks_table.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:erm/Pages/riskRegister/widgets/heat_map.dart';
import 'package:flutter/material.dart';

class RiskRegisterMainContent extends StatefulWidget {
  RiskRegisterMainContent({super.key});

  @override
  State<RiskRegisterMainContent> createState() => _RiskRegisterMainContentState();
}

class _RiskRegisterMainContentState extends State<RiskRegisterMainContent> {




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
                             InkWell(
                              onTap: (){
                                setState(() {
                                  
                                });
                              },
                               child: Icon(
                                Icons.refresh,
                                color: Colors.grey.shade600,
                                                           ),
                             ),
                             AddRiskModal(),
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
                  RisksTable(),
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
