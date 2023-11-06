class DateCalculator {
  static String calculateTime(DateTime date) {
    Duration diff = DateTime.now().difference(date);
    int minutes = diff.inMinutes;
    int hours = diff.inHours;
    int days = diff.inDays;
    if (hours < 1) {
      return '${minutes}m ago';
    } else if (days < 1) {
      return '${hours}h ago';
    } else if (days < 30) {
      return '${days}d ago';
    }
    return '${date.year}/${date.month}/${date.day}';
  }
}
