class Util {
  static bool validateEmail(String? s) {
    if (s == null) {
      return false;
    }

    return RegExp(r'^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.+-]+\.[a-zA-Z]+').hasMatch(s);
  }

  static String getTimeFromString(String inputDateString) {
    DateTime inputDate = DateTime.parse(inputDateString);
    return formatTime(inputDate);
  }

  static String getTimeDifference(String? inputDateString) {
    if (inputDateString == null) {
      return "";
    }

    // Get the current date and time
    DateTime now = DateTime.now();
    DateTime inputDate = DateTime.parse(inputDateString);

    // Calculate the time difference
    Duration difference = now.difference(inputDate);

    // Check if the date is in the future
    if (difference.isNegative) {
      return 'Date is in the future';
    }

    // Check if it's today
    if (difference.inDays == 0) {
      return formatTime(inputDate);
    }

    // Check if it's yesterday
    if (difference.inDays == 1) {
      return 'Yesterday';
    }

    // Check if it's within a week
    if (difference.inDays < 7) {
      return getDayOfWeek(inputDate);
    }

    // More than a week, show the date
    return '${inputDate.day}/${inputDate.month}/${inputDate.year}';
  }

  static String getDayOfWeek(DateTime date) {
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return daysOfWeek[date.weekday - 1];
  }

  static String formatTime(DateTime time) {
    int hour = time.hour;
    String period = 'AM';

    if (hour >= 12) {
      period = 'PM';
      if (hour > 12) {
        hour -= 12;
      }
    }

    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }
}
