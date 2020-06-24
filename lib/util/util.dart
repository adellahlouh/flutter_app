

import 'dart:ui';
import 'package:flutterapp/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

String getStringFromEnum(Object value) => value.toString().split('.').last;

T enumValueFromString<T>(String key, List<T> values) =>
    values.firstWhere((v) => key == getStringFromEnum(v), orElse: () => null);


Future<dynamic> openNewPage(BuildContext context, Widget widget,
    {bool popPreviousPages = false}) {

  if (!popPreviousPages)
    return Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  else
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
            (Route<dynamic> route) => false);

}

String getTimeFromTimestamp(int timestamp) {

  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var diff = now.difference(date);
  var time = '';


  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0 ) {
    time = "${date.isToday()?"Today":"Yesterday"} at " + format.format(date);
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' DAY AGO';
    } else {
      time = diff.inDays.toString() + ' DAYs AGO';
    }
  } else if (diff.inDays > 7 && diff.inDays < 100) {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
    } else {
      time = (diff.inDays / 7).floor().toString() + ' WEEKs AGO';
    }
  } else {
    var formatY = DateFormat('dd/MM/yyyy HH:mm a');
    time = formatY.format(date);
  }

  return time;
}