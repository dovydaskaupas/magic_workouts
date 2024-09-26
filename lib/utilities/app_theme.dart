import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme _singleton = AppTheme._internal();
  AppTheme._internal();
  static AppTheme get instance => _singleton;

  static const Color _primary = Colors.white;
  static const Color _secondary = Color(0xff424242);

  ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        primary: _primary,
        secondary: _secondary,
        surface: _primary,
        seedColor: _primary,
      ),
      cardTheme: const CardTheme(color: _secondary),
      iconTheme: const IconThemeData(color: _primary),
      useMaterial3: true,
    );
  }
}
