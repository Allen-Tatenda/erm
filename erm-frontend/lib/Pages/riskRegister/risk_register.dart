import 'package:erm/Pages/riskRegister/widgets/hero.dart';
import 'package:erm/Pages/riskRegister/widgets/horizontal_divider.dart';
import 'package:erm/Pages/riskRegister/widgets/main_content.dart';
import 'package:erm/Pages/riskRegister/widgets/pie_chart.dart';
import 'package:erm/Pages/riskRegister/widgets/risk_nav_info.dart';
import 'package:erm_logic/helpers/constants.dart';
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
          if (width < 672) {
                   return  Column(
              children: [
                Row(
                  children: [
                    StreamBuilder<int>(
                      stream: totalRisks.stream,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return RiskNavInfo(header: 'Total Risks', value: snapshot.data.toString(), trailing: '');
                        }
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    ),
                    const HorizontalDivider(),
                    const RiskNavInfo(
                    header: 'Risk Exposure', value: '1.29', trailing: 'M\$'),
                  ],
                ),
                
                
                
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RiskNavInfo(
                        header: 'Treatment Activities', value: '216', trailing: ''),
                        HorizontalDivider(),
                         RiskNavInfo(
                    header: 'Treatment Progress', value: '62', trailing: '%'),
                  ],
                ),
              
               const Row(
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
          
          return Row(
              children: [
                 StreamBuilder<int>(
                      stream: totalRisks.stream,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return RiskNavInfo(header: 'Total Risks', value: snapshot.data.toString(), trailing: '');
                        }
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    ),
                const HorizontalDivider(),
                const RiskNavInfo(
                    header: 'Risk Exposure', value: '1.29', trailing: 'M\$'),
                const HorizontalDivider(),
                const RiskNavInfo(
                    header: 'Treatment Activities', value: '216', trailing: ''),
                const HorizontalDivider(),
                const RiskNavInfo(
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
            );
        }),
        
            const RiskRegisterMainContent()
          ],
        ),
      ),
    );
  }
}
