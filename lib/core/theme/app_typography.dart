import 'package:flutter/material.dart';

class AppTypography {
  static TextTheme textTheme(BuildContext context) {
    final base = Theme.of(context).textTheme;
    return base.apply(
      fontFamily: 'Roboto',
      displayColor: base.bodyLarge?.color,
      bodyColor: base.bodyLarge?.color,
    );
  }
}
