import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum LegendShape { circle, rectangle }

class MyPieChart extends StatefulWidget {
  const MyPieChart({Key? key, required this.header}) : super(key: key);
  final String header;

  @override
  MyPieChartState createState() => MyPieChartState();
}

class MyPieChartState extends State<MyPieChart> {
  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  // final legendLabels = <String, String>{
  //   "Flutter": "Flutter legend",
  //   "React": "React legend",
  //   "Xamarin": "Xamarin legend",
  //   "Ionic": "Ionic legend",
  // };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  final bool _showCenterText = true;
  final bool _showCenterWidget = true;
  final double _ringStrokeWidth = 32;
  final double _chartLegendSpacing = 32;

  final bool _showLegendsInRow = false;
  final bool _showLegends = true;
  final bool _showLegendLabel = false;

  final bool _showChartValueBackground = true;
  final bool _showChartValues = true;
  final bool _showChartValuesInPercentage = false;
  final bool _showChartValuesOutside = false;

  final bool _showGradientColors = false;

  final LegendShape _legendShape = LegendShape.circle;
  final LegendPosition _legendPosition = LegendPosition.right;

  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 40),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      centerText: null,
      centerWidget: null,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition,
        showLegends: false,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: true,
      ),
      ringStrokeWidth: 6,
      emptyColor: Colors.grey,
      gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );
String header = widget.header;
     return LayoutBuilder(builder: (context, widget) {
      var width = MediaQuery.of(context).size.width;
      print(width);
      if (width < 672) {
       return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 32,
      height: 140,
      child: Column(
        children: [
          Text(
            header,
            style: const TextStyle(
                fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 14),
          ),
          LayoutBuilder(
            builder: (_, constraints) {
              if (constraints.maxWidth >= 600) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: chart,
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 32,
                        ),
                        child: chart,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
      }
       return SizedBox(
      width: (MediaQuery.of(context).size.width / 6) - 14,
      height: 140,
      child: Column(
        children: [
          Text(
            header,
            style: const TextStyle(
                fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 14),
          ),
          LayoutBuilder(
            builder: (_, constraints) {
              if (constraints.maxWidth >= 600) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: chart,
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 32,
                        ),
                        child: chart,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
    });

    
  }
}
