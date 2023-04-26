import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LogicHelpers {
  static String formatDateTimeString(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    final formattedDateTime = DateFormat('EEEE, d MMMM yyyy').format(dateTime);
    return formattedDateTime;
  }

  static String formatDateTime(String dateTimeString) {
    // Define the weekday and month names to use in the format
    final List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // Parse the input string into a DateTime object
    final DateTime dateTime = DateTime.parse(dateTimeString);

    // Extract the date and time components from the DateTime object
    final int day = dateTime.day;
    final int weekdayIndex = dateTime.weekday - 1;
    final int monthIndex = dateTime.month - 1;
    final int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final String minute =
        dateTime.minute < 10 ? '0${dateTime.minute}' : '${dateTime.minute}';
    final String amPm = dateTime.hour < 12 ? 'Am' : 'Pm';

    // Combine the components into a formatted string
    final String formattedDateTime =
        '${weekdays[weekdayIndex]}, ${months[monthIndex]} $day - $hour:$minute $amPm';
    return formattedDateTime;
  }

  static Future<void> launchLink(String? link) async {
    String url = '';
    if (!link!.startsWith('http://') && !link.startsWith('https://')) {
      url = 'https://$link';
    } else {
      url = link;
    }
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

}
