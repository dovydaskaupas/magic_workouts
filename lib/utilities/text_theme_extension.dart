import 'package:flutter/material.dart';

extension AppTextTheme on TextTheme {
  TextStyle get title {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get cardTitle {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get label {
    return const TextStyle(
      color: Colors.white,
      fontSize: 14,
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

  TextStyle get hint {
    return const TextStyle(
      color: Colors.white70,
      fontSize: 14,
      fontStyle: FontStyle.italic,
    );
  }
}
