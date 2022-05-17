import 'package:intl/intl.dart';
// Converts Number to 00 string

toTwoDigits(int digit) => digit < 10 ? '0$digit' : digit;

/// Returns time in HH:MM
dateTimeToHm(DateTime date) {
  DateFormat format = DateFormat.Hm();
  return '${format.format(date)}';
}

/// Returns DateTime in DD:mm:YYYY
dateTimeToDDmmYY(DateTime date) {
  return '${toTwoDigits(date.day)}.${toTwoDigits(date.month)}.${date.year}';
}

/// Returns DateTime in DD:mm:YYYY HH:MM
dateTimeFormat(DateTime date) {
  return dateTimeToDDmmYY(date) + '\n' + dateTimeToHm(date);
}
