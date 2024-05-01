import 'dart:async';
import 'package:flutter/material.dart';

StreamController<String> loginError = StreamController<String>.broadcast();
StreamController riskInfoStream = StreamController.broadcast();
StreamController<int> settingsPageController = StreamController<int>.broadcast();

var singleRiskData;

 class Constants{
  
  String baseUrl = 'http://127.0.0.1:8000';
  
   
}