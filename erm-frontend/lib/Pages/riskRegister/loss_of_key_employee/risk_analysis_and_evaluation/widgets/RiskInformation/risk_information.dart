import 'package:erm/Pages/riskRegister/loss_of_key_employee/risk_analysis_and_evaluation/widgets/RiskInformation/widgets/risk_info_subheading_text.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/material.dart';

import 'widgets/risk-infomation_header.dart';

class RiskInformation extends StatelessWidget {
  RiskInformation({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: (MediaQuery.of(context).size.width / 3) - 36,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black12),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             RiskInformationHeader(
              heading: 'RISK INFORMATION',
              logic: true,
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'EDIT RATINGS',
              text: 'Open',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const Text(
                      'PRIORITY',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                          color:Colors.grey),
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: ( singleRiskData['priority'] =='1')?Colors.red:( singleRiskData['priority'] =='2')?Colors.amber:( singleRiskData['priority'] =='3')?Colors.blue:Colors.green,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ]),
            ),
             RiskInfoSubHeadingAndText(
              subheading: 'RISK ID',
              text: singleRiskData['risk_id']
            ),
             RiskInfoSubHeadingAndText(
              subheading: 'RISK',
              text: singleRiskData['risk_name']
            ),
             RiskInfoSubHeadingAndText(
              subheading: 'RISK DESCRIPTION',
              text: singleRiskData['risk_description']
            ),
             RiskInfoSubHeadingAndText(
              subheading: 'RISK OWNER',
              text: "${singleRiskData['risk_owner']['firstname']} ${singleRiskData['risk_owner']['lastname']}",
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'RISK CATEGORY',
              text: 'Organisational',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'DATE IDENTIFIED',
              text: 'Feb 26, 2023',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'DIVISION',
              text: 'Human Resources',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'STRATEGIC OBJECTIVE',
              text: 'Employee engagement and retention',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'THREAT / OPPORTUNITY',
              text: 'Threat',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'INHERENT LIKELIHOOD VALUE',
              text: '4',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'INHERENT IMPACT VALUE',
              text: '4',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'INHERENT RISK LEVEL',
              text: '10',
            ),
          ],
        ),
      ),
    );
  }
}
