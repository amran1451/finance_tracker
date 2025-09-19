import 'package:intl/intl.dart';

String formatDate(DateTime date) => DateFormat.yMMMMd().format(date);
String formatMonth(DateTime date) => DateFormat.yMMMM().format(date);
String formatTime(DateTime date) => DateFormat.Hm().format(date);
