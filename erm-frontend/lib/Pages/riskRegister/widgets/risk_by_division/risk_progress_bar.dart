import 'package:flutter/material.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

final themeMode = ValueNotifier(Brightness.light);

class RiskProgressBar extends StatefulWidget {
  const RiskProgressBar({super.key});

  @override
  State<RiskProgressBar> createState() => _RiskProgressBarState();
}

class _RiskProgressBarState extends State<RiskProgressBar> {
  final segments = const [
    Segment(
      color: Colors.green,
      value: 25,
    ),
    Segment(
      color: Colors.lime,
      value: 50,
    ),
    Segment(
      color: Colors.purple,
      value: 25,
    ),
  ];

  late final maxTotalValue = segments.fold(0, (acc, seg) => acc + seg.value);

  late int displaySegmentCount = segments.length;
  bool alwaysFillBar = true;
  bool limitLegendLines = false;

  @override
  Widget build(BuildContext context) {
    final progressBar = PrimerProgressBar(
      segments: segments.take(displaySegmentCount).toList(),
      maxTotalValue: alwaysFillBar ? null : maxTotalValue,
      legendStyle: limitLegendLines
          ? const SegmentedBarLegendStyle(maxLines: 2)
          : const SegmentedBarLegendStyle(maxLines: null),
      legendEllipsisBuilder: (truncatedItemCount) {
        final value = segments
            .skip(segments.length - truncatedItemCount)
            .fold(0, (accValue, segment) => accValue + segment.value);
        return LegendItem(
          segment: Segment(
            value: value,
            color: Colors.grey,
            //label: const Text("Other"),
            //valueLabel: Text("$value%"),
          ),
        );
      },
    );

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
        progressBar,
      ],
    );
  }
}
