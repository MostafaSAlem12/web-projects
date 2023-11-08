import 'package:jiffy/jiffy.dart';

class DateCalculator {
  static String calculateTime(DateTime date) {
    // final DateTime now = DateTime.now();
    return Jiffy.parse(date.toIso8601String()).fromNow();
    // Duration diff = now.difference(date);
    // int minutes = diff.inMinutes;
    // int hours = diff.inHours;
    // int days = diff.inDays;
    // if (hours < 1) {
    //   if (minutes < 2) return 'a minute ago';
    //   return '$minutes minutes ago';
    // } else if (days < 1) {
    //   if (hours < 2) return 'an hour ago';
    //   return '$hours hours ago';
    // } else if (now.month == date.month) {
    //   if (days < 2) return 'a day ago';
    //   return '$days days ago';
    // }
    // // else if (now.compareTo(date)) {
    // //   final int months = now.month - date.month;
    // //   if (months < 2) return 'a month ago';
    // //   return '$months months ago';
    // // } else if (now.year - date.year < 5) {
    // //   final int years = now.year - date.year;
    // //   if (years < 2) return 'a year ago';
    // //   return '$years years ago';
    // // }
    // return '${date.year}/${date.month}/${date.day}';
  }
}
