import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String? formatDate(DateTime? date) {
    if(date==null) return null;
    String formattedDate = DateFormat('MMM yyyy').format(date);
    return formattedDate;
  }
}
