import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'general_utils.dart';

class ThreeDigitFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    String decimal = '';
    if (newText.contains('.')) {
      decimal = newText.substring(newText.indexOf('.'), newText.length);
      newText = newText.substring(0, newText.indexOf('.'));
    }

    String text = _appendCommas(newText);
    text = text + decimal;

    return newValue.copyWith(
      text: text,
      selection: newValue.selection.copyWith(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }

  String _appendCommas(String newText) {
    String text = newText.replaceAll(',', '');
    text = text.replaceAll('.', '');
    int breakPoint = 3;

    while (text.length - breakPoint > 0) {
      String firstPart = text.substring(0, text.length - breakPoint);
      String lastPart = text.substring(text.length - breakPoint, text.length);
      text = '$firstPart,$lastPart';
      breakPoint += 4;
    }
    return text;
  }
}

class CurrencyTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    newText = newText.replaceAll('\$', '');
    newText = newText.replaceAll(',', '');
    if (newText != '.00' && newText.isNotEmpty) {
      if (newValue.text.isNotEmpty) {
        var moneyFormat = NumberFormat.currency(locale: "en_US", symbol: "\$");
        newText = moneyFormat.format(double.parse(newText));
      }
    } else {
      newText = '';
    }

    TextSelection? selection;

    if (newText.isNotEmpty) {
      if (newText.substring(newText.indexOf('.'), newText.length) == '.00') {
        String text = newText.substring(0, newText.indexOf('.'));
        selection = newValue.selection.copyWith(
          baseOffset: text.length,
          extentOffset: text.length,
        );
      }
    } else {
      selection = newValue.selection.copyWith(
        baseOffset: newText.length,
        extentOffset: newText.length,
      );
    }

    return newValue.copyWith(
      text: newText,
      selection: selection,
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < math.min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = GeneralUtils.phoneNumberTextInputFormatter(newValue.text);

    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

class SSNFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = GeneralUtils.formatSSN(newValue.text);

    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
