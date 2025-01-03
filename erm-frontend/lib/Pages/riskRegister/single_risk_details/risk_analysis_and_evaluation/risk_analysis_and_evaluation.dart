import 'package:erm/Pages/riskRegister/single_risk_details/risk_analysis_and_evaluation/widgets/RiskInformation/risk_information.dart';
import 'package:erm/Pages/riskRegister/single_risk_details/risk_analysis_and_evaluation/widgets/inherent_risk_column/inherent_risk_column.dart';
import 'package:flutter/material.dart';

import 'widgets/risk_rating_column/risk_rating_column.dart';

class RiskAnalysisAndEvaluation extends StatefulWidget {
  const RiskAnalysisAndEvaluation({super.key});

  @override
  State<RiskAnalysisAndEvaluation> createState() =>
      _RiskAnalysisAndEvaluationState();
}

class _RiskAnalysisAndEvaluationState extends State<RiskAnalysisAndEvaluation> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RiskInformation(),
              RiskRatingColumn(),
              InherentRiskColumn()
            ],
          ),
        ],
      ),
    );
  }
}
