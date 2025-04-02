import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

import '../enums/days.dart';

class GeneralUtils {
  static String formatDate(DateTime date) {
    var formatter = DateFormat('MMMM dd, yyyy');
    return formatter.format(date);
  }

// String _formattedDate(DateTime date) {
//     String formatted = DateFormat("MMM d'${Helpers.getDayOfMonthSuffix(date.day)}', yyyy").format(date);
//     return formatted;
//   }
  static String formatDateTime(String date) {
    DateTime now = DateTime.parse(date);
    String formattedDate = DateFormat('MMM dd, K:mm a').format(now);
    return formattedDate;
  }

  static String appendCommas(String newText) {
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

  static String extractName(String name) {
    if (name.startsWith("<")) {
      // name = name.replaceAll(RegExp('[^A-Za-z@]'), "");
      name = name.replaceAll(">", "");
      name = name.replaceAll("<", "");
      name = name.replaceAll('"', "");
      return name;
    }
    var newName = name.split('<');
    return newName[0];
  }

  static String extractEmail(String string) {
    final emailPattern = RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b', caseSensitive: false, multiLine: true);
    final matches = emailPattern.allMatches(string);
    final List<String> emails = [];
    for (final Match match in matches) {
      emails.add(string.substring(match.start, match.end));
    }
    return emails[0];
  
    return '';
  }

  static String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static int _numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  static int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(date.year - 1);
    } else if (woy > _numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  static String parseDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }

  static String fomartedHMS(String timeInSecond) {
    int seconds = int.parse(timeInSecond);
    int sec = seconds % 60;
    int min = (seconds / 60).floor();
    int hour = (seconds / (60 * 60)).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    String hours = hour.toString().length <= 1 ? "0$hour" : "$hour";
    return "$hours:$minute:$second";
  }

  static String parseDurationInSeconds(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static String durationHMS(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours.remainder(60));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  static String durationText(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    // String twoDigitHours = twoDigits(duration.inHours);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes min $twoDigitSeconds sec";
  }

  static String timeAp(DateTime time) {
    var formatter = DateFormat('jm');
    return formatter.format(time);
  }

  static String stringDate(DateTime date) {
    var formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(date);
  }

  static String getNotificationtimeLaps(int totalSeconds) {
    var day = 86400;
    var hour = 3600;
    var minute = 60;

    var days = (totalSeconds / day).floor();
    var hours = ((totalSeconds - days * day) / hour).floor();
    var minutes = ((totalSeconds - days * day - hours * hour) / minute).floor();
    var seconds = totalSeconds - days * day - hours * hour - minutes * minute;

    if (totalSeconds > 0 && totalSeconds < minute) {
      return '$totalSeconds sec';
    }

    if (totalSeconds > minute && totalSeconds < hour) {
      return '$minutes min';
    }

    if (totalSeconds > hour && totalSeconds < day) {
      return '$hours h';
    }
    return '$days d';
  }

  static double pageWidth(double screenWidth) {
    if (screenWidth > 1200) return 1370;

    if (screenWidth > 1600) return 1570;

    if (screenWidth > 1900) return 1870;

    return 1370;
  }

  static String extractText(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

  static String fromEnum(Enum enm) {
    return enm.toString();
  }

  static String formatPhoneNumber(String phone) {
    phone = cleanPhoneNumber(phone);

    var formattedPhone = '';

    for (var i = 0; i < phone.length; i++) {
      var character = String.fromCharCode(phone.codeUnitAt(i));
      if (i == 0) {
        formattedPhone += '($character';
      } else if (i == 2) {
        formattedPhone += '$character) ';
      } else if (i == 5) {
        formattedPhone += '$character - ';
      } else {
        formattedPhone += character;
      }
    }

    return formattedPhone;
  }

  static String phoneNumberTextInputFormatter(String value) {
    value = GeneralUtils.cleanPhoneNumber(value);
    var newString = '';

    for (int i = 0; i < math.min(value.length, 10); i++) {
      if (i == 0) {
        newString = '(${value[i]}';
      }

      if (i == 3) {
        newString += ') ${value[i]}';
      }

      if (i == 6) {
        newString += ' - ${value[i]}';
      }

      if (i != 0 && i != 3 && i != 6) {
        newString += value[i];
      }
    }
    return newString;
  }

  static String formatSSN(String ssn) {
    ssn = ssn.replaceAll('-', '');
    ssn = ssn.replaceAll(' ', '');
    var formattedSSN = '';
    for (var i = 0; i < ssn.length; i++) {
      var character = String.fromCharCode(ssn.codeUnitAt(i));
      if (i == 2 || i == 4) {
        formattedSSN += '$character-';
      } else {
        formattedSSN += character;
      }
    }

    return formattedSSN;
  }

  static String formatDateFromString(String? date) {
    if (date != null) {
      DateTime parsedDate = DateTime.parse(date);
      String formattedDate = DateFormat('MM/dd/yy').format(parsedDate);
      return formattedDate;
    }
    return '';
  }

  static double stripMoneyFormatting(String value) {
    if (value.isEmpty) {
      return 0;
    }

    value = value.trim();
    value = value.replaceAll('\$', '');
    value = value.replaceAll(',', '');
    return double.parse(value);
  }

  static String formatMoney(double amount) {
    var formatCurrency = NumberFormat.simpleCurrency();
    return formatCurrency.format(amount);
  }

  static String cleanPhoneNumber(String phoneNumber) {
    // phoneNumber = phoneNumber.trim();
    // phoneNumber = phoneNumber.replaceAll('(', '');
    // phoneNumber = phoneNumber.replaceAll(')', '');
    // phoneNumber = phoneNumber.replaceAll('-', '');
    // phoneNumber = phoneNumber.replaceAll(' ', '');

    // if (phoneNumber.startsWith('+')) {
    //   phoneNumber = phoneNumber.substring(1, phoneNumber.length);
    // }

    // if (phoneNumber.startsWith('1')) {
    //   phoneNumber = phoneNumber.substring(1, phoneNumber.length);
    // }
    // return phoneNumber;

    phoneNumber = phoneNumber.trim();

    if (phoneNumber.length > 3) {
      phoneNumber = phoneNumber.replaceAll('(', '');
      phoneNumber = phoneNumber.replaceAll(')', '');
      phoneNumber = phoneNumber.replaceAll('-', '');
      phoneNumber = phoneNumber.replaceAll(' ', '');
    }

    if (phoneNumber.startsWith('+')) {
      phoneNumber = phoneNumber.substring(1, phoneNumber.length);
    }

    if (phoneNumber.startsWith('1')) {
      if (phoneNumber.length > 3) {
        phoneNumber = phoneNumber.substring(1, phoneNumber.length);
      }
    }
    return phoneNumber;
  }

  static double cleanCurrency(String currency) {
    if (currency.startsWith('\$')) {
      currency = currency.substring(1, currency.length);
    }
    return double.parse(currency.replaceAll(',', ''));
  }

  static String cleanNumber(String number) {
    number = number.replaceAll(',', '');
    return number;
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  static Future<Uint8List> getImageBytesFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    return byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
  }

  static bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static String getRandomString(int length) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    math.Random rnd = math.Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
  }

  static String? getErrorMessage(e) {
    try {
      return e.message;
    } catch (err) {
      return "An error occured. Please try again later.";
    }
  }

  static String getDay(Day day) {
    switch (day) {
      case Day.sunday:
        return 'Sunday';
      case Day.monday:
        return 'Monday';
      case Day.tuesday:
        return 'Tuesday';
      case Day.wednesday:
        return 'Wednesday';
      case Day.thursday:
        return 'Thursday';
      case Day.friday:
        return 'Friday';
      case Day.saturday:
        return 'Saturday';
    }
  }

  static String calculateleadAge(DateTime date) {
    var curentTime = DateTime.now();
    var diff = curentTime.difference(date).inSeconds;
    int h, m, s, d;
    d = diff ~/ (24 * 60 * 60);
    diff -= d * (24 * 60 * 60);
    h = diff ~/ (60 * 60);
    diff -= h * (60 * 60);
    m = diff ~/ (60);
    diff -= m * (60);
    s = diff ~/ (60);

    String result = "${twoDigitNumber(d)}:${twoDigitNumber(h)}:${twoDigitNumber(m)}";

    return result;
  }

  static String calculateTimeClock(DateTime date) {
    DateTime a = date;
    DateTime b = DateTime.now();

    Duration difference = b.difference(a);

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    String result = "${twoDigitNumber(hours)}:${twoDigitNumber(minutes)}:${twoDigitNumber(seconds)}";
    return result;
  }

  static String twoDigitNumber(int? dateTimeNumber) {
    if (dateTimeNumber == null) return "0";
    return (dateTimeNumber < 9 ? "0$dateTimeNumber" : dateTimeNumber).toString();
  }
}
