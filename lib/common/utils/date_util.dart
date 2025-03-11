import 'package:intl/intl.dart';

/// abstract final class : This is a class that cannot be instantiated and cannot be inherited.
/// This class only contains static methods and static properties.
/// This class is used to group common methods that are related to date.
abstract final class DateUtil {
  static String getFormattedDate(DateTime? date, {String format = 'yyyy.MM.dd HH:mm:ss'}) {
    try {
      if (date == null) {
        return 'N/A';
      }
      return DateFormat(format).format(date);
    } catch (e) {
      return 'N/A';
    }
  }
  static String getFormattedDateStr(String? dateStr, {String format = 'yyyy.MM.dd HH:mm:ss'}) {
    try {
      if (dateStr == null) {
        return 'N/A';
      }
      return DateFormat(format).format(DateTime.parse(dateStr));
    } catch (e) {
      return 'N/A';
    }
  }
}