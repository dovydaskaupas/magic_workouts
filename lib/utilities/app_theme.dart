import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme _singleton = AppTheme._internal();
  AppTheme._internal();
  static AppTheme get instance => _singleton;

  static const Color _primary = Color(0xff424242);
  static const Color _surface = Colors.white;

  ThemeData get theme {
    return ThemeData(
      cardTheme: const CardTheme(color: _primary),
      colorScheme: ColorScheme.fromSeed(
        primary: _primary,
        secondary: _primary,
        surface: _surface,
        seedColor: _surface,
      ),
      iconTheme: const IconThemeData(color: _surface),
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: _primary,
      ),
      useMaterial3: true,
    );
  }
}
