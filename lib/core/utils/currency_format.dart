import 'package:intl/intl.dart';

String formatCurrency(num amount, {String currency = 'RUB'}) {
  final formatter = NumberFormat.currency(locale: 'ru_RU', symbol: currency);
  return formatter.format(amount);
}
