import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return FlexThemeData.light(
      useMaterial3: true,
      scheme: FlexScheme.indigoM3,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 8,
    );
  }

  static ThemeData dark() {
    return FlexThemeData.dark(
      useMaterial3: true,
      scheme: FlexScheme.indigoM3,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 12,
    );
  }
}
