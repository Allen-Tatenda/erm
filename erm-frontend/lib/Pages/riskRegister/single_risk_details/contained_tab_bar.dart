import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:erm/Pages/riskRegister/single_risk_details/risk_analysis_and_evaluation/risk_analysis_and_evaluation.dart';
import 'package:erm/Pages/riskRegister/single_risk_details/existing_controls/existing_controls.dart';
import 'package:flutter/material.dart';

class LossOfKeyContainedTabBar extends StatefulWidget {
  LossOfKeyContainedTabBar( {super.key});

  @override
  State<LossOfKeyContainedTabBar> createState() =>
      _LossOfKeyContainedTabBarState();
}

class _LossOfKeyContainedTabBarState extends State<LossOfKeyContainedTabBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 178,
      child: ContainedTabBarView(
        tabs: const [
          Text(
            'Risk Analysis & Evaluation',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Existing Controls',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Treatment Activities',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Internal Audits',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Reports',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          )
        ],
        tabBarProperties: TabBarProperties(
            height: 32,
            background: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            position: TabBarPosition.top,
            alignment: TabBarAlignment.start,
            indicatorColor: Colors.black,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.red,
            isScrollable: true),
        views:  [
          RiskAnalysisAndEvaluation(),
          ExistingControls(),
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.red)
        ],
      ),
    );
  }
}
