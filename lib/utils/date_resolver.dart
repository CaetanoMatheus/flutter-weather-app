import 'package:intl/intl.dart';

abstract class DateResolver {
  static final months = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Juk',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  static final weekDays = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun',
  };

  static String parse(DateTime? date) {
    final day = DateTime.now().day == date?.day
        ? 'Today'
        : weekDays[date?.weekday] ?? '';
    final month = months[date?.month];

    return '$day, ${date?.day} $month';
  }

  static String parseHour(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }
}
