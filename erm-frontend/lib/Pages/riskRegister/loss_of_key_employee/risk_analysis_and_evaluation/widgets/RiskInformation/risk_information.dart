import 'package:erm/Pages/riskRegister/loss_of_key_employee/risk_analysis_and_evaluation/widgets/RiskInformation/widgets/risk_info_subheading_text.dart';
import 'package:flutter/material.dart';

import 'widgets/risk-infomation_header.dart';

class RiskInformation extends StatelessWidget {
  const RiskInformation({
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
            const RiskInformationHeader(
              heading: 'RISK INFORMATION',
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
                          color: Colors.grey),
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ]),
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'RISK ID',
              text: 'R1003-3',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'RISK',
              text: 'Loss of key employee',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'RISK DESCRIPTION',
              text:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            ),
            const RiskInfoSubHeadingAndText(
              subheading: 'RISK OWNER',
              text: 'Sarah Robert',
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
