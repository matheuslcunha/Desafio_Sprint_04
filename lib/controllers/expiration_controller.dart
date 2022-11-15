import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpirationController {
  DateTime now = DateTime.now();
  Duration diff = Duration();

  expirationFeedback(DateTime date) {
    diff = date.difference(now);

    if (diff.isNegative) {
      diff = diff.abs();
    }

    if (diff.inHours >= 0 && diff.inHours < 48) {
      return Colors.red;
    } else if (diff.inHours > 47 && diff.inHours < 96) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  formatDate(DateTime date) {
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(date);
    return outputDate;
  }
}
