import 'dart:async';
import 'package:erm_logic/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';

StreamController<String> authError = StreamController<String>.broadcast();
StreamController riskInfoStream = StreamController.broadcast();
StreamController<int> settingsPageController = StreamController<int>.broadcast();
StreamController<int> totalRisks = StreamController<int>.broadcast();
StreamController riskRatingController = StreamController.broadcast();
StreamController riskConsequencesController = StreamController.broadcast();

var singleRiskData;

 class Constants{
  
  String baseUrl = 'http://127.0.0.1:8000';
  
   Future<dynamic> showDialogMethod(c,msg) {
  return showDialog(
      context: c,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return ProgressDialog(
          message: msg,
        );
      });
}
}