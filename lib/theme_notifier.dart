import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  static const _boxName = 'settings';
  static const _themeKey = 'theme_mode';

  late Box _box;

  ThemeNotifier() : super(ThemeMode.system);

  Future<void> loadTheme() async {
    _box = await Hive.openBox(_boxName);
    final saved = _box.get(_themeKey, defaultValue: 'system') as String;
    switch (saved) {
      case 'light':
        value = ThemeMode.light;
        break;
      case 'dark':
        value = ThemeMode.dark;
        break;
      default:
        value = ThemeMode.system;
    }
  }

  Future<void> updateTheme(ThemeMode mode) async {
    value = mode;
    await _box.put(_themeKey, _modeToString(mode));
  }

  String _modeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }
}