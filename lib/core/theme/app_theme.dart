import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = ChangeNotifierProvider<AppThemeNotifier>((ref) {
  return AppThemeNotifier();
});

class AppThemeNotifier extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.deepBlue,
        useMaterial3: true,
      );

  ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.deepBlue,
        useMaterial3: true,
      );

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}
