import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 200,
        child: LoadingIndicator (
              indicatorType: Indicator.audioEqualizer, /// Required, The loading type of the widget
              colors: [Colors.blue,Colors.red,Colors.amber,Colors.green],       /// Optional, The color collections
              strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
              backgroundColor: Colors.transparent,      /// Optional, Background of the widget
              pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
          ),
      ),
    );
  }
}