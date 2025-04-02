import 'package:intl/intl.dart';

class DateTimeHelpers {

  static String formatDate(DateTime date){
     var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
  static DateTime getFirstDateOfWeek(DateTime date) {
    DateTime firstDayOfWeek = date;

    while (firstDayOfWeek.weekday != DateTime.sunday) {
      firstDayOfWeek = firstDayOfWeek.subtract(const Duration(days: 1));
    }
    return firstDayOfWeek;
  }

  static DateTime getLastDateOfWeek(DateTime date) {
    DateTime lastDayOfWeek = date;

    while (lastDayOfWeek.weekday != DateTime.saturday) {
      lastDayOfWeek = lastDayOfWeek.add(const Duration(days: 1));
    }

    return lastDayOfWeek;
  }

  static Week getWeekFromDate(DateTime date) {
    var startDate = getFirstDateOfWeek(date);
    var endDate = getLastDateOfWeek(date);
    return Week(
      endDate: endDate,
      startDate: startDate,
    );
  }

  static String toShortString(DateTime date) {
    var formatter = DateFormat('MM/dd/yyyy');
    return formatter.format(date);
  }

  static DateTime curDateTimeByZone({
    required DateTime utcTime,
    required double offset,
  }) {
    DateTime returner;
    Duration subtr;
    Duration addr;

    if (offset <= 0) {
      subtr = Duration(
        hours: offset.abs().truncate(),
        minutes: ((offset.abs() % 1) * 60).round(),
      );
      returner = utcTime.subtract(subtr);
    } else {
      addr = Duration(
        hours: offset.truncate(),
        minutes: ((offset % 1) * 60).round(),
      );
      returner = utcTime.add(addr);
    }
    return returner;
  }

  static String getWeekDayFromInt(int i) {
    switch (i) {
      case DateTime.sunday:
        return 'Sunday';
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }
}

class Week {
  final DateTime startDate;
  final DateTime endDate;

  Week({
    required this.endDate,
    required this.startDate,
  });

  @override
  String toString() {
    var formatter = DateFormat('MMM dd');
    var start = formatter.format(startDate);
    var end = formatter.format(endDate);
    return '$start - $end';
  }

  Week get next {
    DateTime date = endDate.add(const Duration(days: 1));
    return DateTimeHelpers.getWeekFromDate(date);
  }

  Week get previous {
    DateTime date = startDate.subtract(const Duration(days: 1));
    return DateTimeHelpers.getWeekFromDate(date);
  }
}
