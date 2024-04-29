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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const RiskRegisterHero(),
            const SizedBox(
              height: 18,
            ),
           LayoutBuilder(builder: (context, widget) {
          var width = MediaQuery.of(context).size.width;
          print(width);
          if (width < 672) {
                   return const Column(
              children: [
                Row(
                  children: [
                    RiskNavInfo(header: 'Total Risks', value: '55', trailing: ''),
                    HorizontalDivider(),
                    RiskNavInfo(
                    header: 'Risk Exposure', value: '1.29', trailing: 'M\$'),
                  ],
                ),
                
                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RiskNavInfo(
                        header: 'Treatment Activities', value: '216', trailing: ''),
                        HorizontalDivider(),
                         RiskNavInfo(
                    header: 'Treatment Progress', value: '62', trailing: '%'),
                  ],
                ),
              
               Row(
                children: [
        MyPieChart(
                  header: 'Inherent Risks',
                ),
                 HorizontalDivider(),
                MyPieChart(
                  header: 'Residual Risks',
                )
                ],
               )
               
                
              ],
            );
          }
          
          return const Row(
              children: [
                RiskNavInfo(header: 'Total Risks', value: '55', trailing: ''),
                HorizontalDivider(),
                RiskNavInfo(
                    header: 'Risk Exposure', value: '1.29', trailing: 'M\$'),
                HorizontalDivider(),
                RiskNavInfo(
                    header: 'Treatment Activities', value: '216', trailing: ''),
                HorizontalDivider(),
                RiskNavInfo(
                    header: 'Treatment Progress', value: '62', trailing: '%'),
                HorizontalDivider(),
                MyPieChart(
                  header: 'Inherent Risks',
                ),
                HorizontalDivider(),
                MyPieChart(
                  header: 'Residual Risks',
                )
              ],
            );
        }),
        
            RiskRegisterMainContent()
          ],
        ),
      ),
    );
  }
}
