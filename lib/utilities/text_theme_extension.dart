import 'package:flutter/material.dart';

extension AppTextTheme on TextTheme {
  TextStyle get title {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get value {
    return const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontStyle: FontStyle.italic,
    );
  }
}
