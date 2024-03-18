import 'dart:async';

import 'package:erm/Pages/homepage/responsive.dart';
import 'package:erm/Pages/riskRegister/risk_register.dart';
import 'package:flutter/material.dart';

import '../Pages/riskRegister/loss_of_key_employee/loss_of_key_employee.dart';

int pageIndex = 0;
StreamController<int> navigationStream = StreamController<int>.broadcast();
List<Widget> myPages = [const HomePageResponsive(), const RiskRegisterPage(),const LossOfKeyEmployee()];
