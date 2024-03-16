import 'package:erm/Pages/riskRegister/widgets/hero.dart';
import 'package:erm/Pages/riskRegister/widgets/horizontal_divider.dart';
import 'package:erm/Pages/riskRegister/widgets/main_content.dart';
import 'package:erm/Pages/riskRegister/widgets/pie_chart.dart';
import 'package:erm/Pages/riskRegister/widgets/risk_nav_info.dart';
import 'package:flutter/material.dart';

class RiskRegisterPage extends StatelessWidget {
  const RiskRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RiskRegisterHero(),
        const SizedBox(
          height: 18,
        ),
        Row(
          children: [
            RiskNavInfo(header: 'Total Risks', value: '55', trailing: ''),
            const HorizontalDivider(),
            RiskNavInfo(
                header: 'Risk Exposure', value: '1.29', trailing: 'M\$'),
            const HorizontalDivider(),
            RiskNavInfo(
                header: 'Treatment Activities', value: '216', trailing: ''),
            const HorizontalDivider(),
            RiskNavInfo(
                header: 'Treatment Progress', value: '62', trailing: '%'),
            const HorizontalDivider(),
            const MyPieChart(
              header: 'Inherent Risks',
            ),
            const HorizontalDivider(),
            const MyPieChart(
              header: 'Residual Risks',
            )
          ],
        ),
        RiskRegisterMainContent()
      ],
    );
  }
}
