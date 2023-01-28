import 'package:intl/intl.dart';

class DateUtil {
  static String fixDate(int timestamp) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    return DateFormat('hh a').format(dt);
  }
}
