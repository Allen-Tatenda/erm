import 'dart:math';

import 'package:fl_heatmap/fl_heatmap.dart';
import 'package:flutter/material.dart';

class HeatMap extends StatefulWidget {
  const HeatMap({super.key, required this.heading});
  final String heading;

  @override
  State<HeatMap> createState() => _HeatMapState();
}

class _HeatMapState extends State<HeatMap> {
  HeatmapItem? selectedItem;

  late HeatmapData heatmapData;

  @override
  void initState() {
    _initExampleData();
    super.initState();
  }

  void _initExampleData() {
    const rows = ['5', '4', '3', '2', '1'];
    const columns = [
      '1',
      '2',
      '3',
      '4',
      '5',
    ];
    final r = Random();
    const String unit = 'kWh';
    heatmapData = HeatmapData(rows: rows, columns: columns, items: [
      for (int row = 0; row < rows.length; row++)
        for (int col = 0; col < columns.length; col++)
          HeatmapItem(
              value: r.nextDouble() * 6,
              unit: unit,
              xAxisLabel: columns[col],
              yAxisLabel: rows[row]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final title = selectedItem != null
        ? '${selectedItem!.value.toStringAsFixed(2)} ${selectedItem!.unit}'
        : widget.heading;
    // '--- ${heatmapData.items.first.unit}';
    final subtitle = selectedItem != null
        ? '${selectedItem!.xAxisLabel} ${selectedItem!.yAxisLabel}'
        : '---';
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 1, color: Colors.black12),
            borderRadius: BorderRadius.circular(4)),
        width: 420,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(subtitle),
            const SizedBox(height: 8),
            SizedBox(
              width: 300,
              height: 300,
              child: Heatmap(
                  onItemSelectedListener: (HeatmapItem? selectedItem) {
                    debugPrint(
                        'Item ${selectedItem?.yAxisLabel}/${selectedItem?.xAxisLabel} with value ${selectedItem?.value} selected');
                    setState(() {
                      this.selectedItem = selectedItem;
                    });
                  },
                  rowsVisible: 5,
                  heatmapData: heatmapData),
            )
          ],
        ),
      ),
    );
  }
}
