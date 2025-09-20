import 'package:intl/intl.dart';

final _currencyFormat = NumberFormat.currency(locale: 'ru_RU', symbol: '₽');

String formatAmount(int amount) {
  final value = amount / 100;
  return _currencyFormat.format(value);
}

String formatAmountShort(int amount) {
  final absValue = amount.abs();
  if (absValue >= 1000000) {
    return '${(amount / 1000000).toStringAsFixed(1)}M';
  }
  if (absValue >= 1000) {
    return '${(amount / 1000).toStringAsFixed(1)}K';
  }
  return formatAmount(amount);
}

int parseAmountInput(String input) {
  var normalized = input.trim().toLowerCase().replaceAll(',', '.');
  if (normalized.isEmpty) {
    return 0;
  }
  bool negative = false;
  if (normalized.startsWith('-')) {
    negative = true;
    normalized = normalized.substring(1);
  }
  double multiplier = 1;
  if (normalized.endsWith('k')) {
    multiplier = 1000;
    normalized = normalized.substring(0, normalized.length - 1);
  }
  if (normalized.endsWith('m')) {
    multiplier = 1000000;
    normalized = normalized.substring(0, normalized.length - 1);
  }
  final value = double.tryParse(normalized) ?? 0;
  final cents = (value * multiplier * 100).round();
  return negative ? -cents : cents;
}

String formatDate(DateTime date) {
  final formatter = DateFormat('dd MMM HH:mm', 'ru_RU');
  return formatter.format(date);
}
