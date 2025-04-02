import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth = 0;
  static double screenHeight = 0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = screenHeight / 100;

    textMultiplier = _blockHeight;

    heightMultiplier = _blockHeight;

    if (screenHeight > 620) {
      textMultiplier = _blockHeight / 1.15;

      heightMultiplier = _blockHeight / 1.15;
    }
    if (screenHeight > 720) {
      textMultiplier = _blockHeight / 1.25;

      heightMultiplier = _blockHeight / 1.25;
    }
    if (screenHeight > 820) {
      print('called text multipler text multi value');
      textMultiplier = _blockHeight / 1.25;

      heightMultiplier = _blockHeight / 1.25;
    }
    if (screenHeight > 920) {
      textMultiplier = _blockHeight / 1.30;
      heightMultiplier = _blockHeight / 1.30;
    }

    print('text multi value $textMultiplier $screenHeight $_blockHeight');
    imageSizeMultiplier = _blockWidth;

    widthMultiplier = _blockWidth;

    print(_screenWidth);
  }
}
