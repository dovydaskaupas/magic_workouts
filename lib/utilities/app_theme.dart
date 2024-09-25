import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme _singleton = AppTheme._internal();
  AppTheme._internal();
  static AppTheme get instance => _singleton;

  static const Color _primary = Colors.white;

  ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        surface: _primary,
        seedColor: _primary,
      ),
      useMaterial3: true,
    );
  }
}
