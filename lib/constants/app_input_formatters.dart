import 'package:flutter/services.dart';

class AppInputFormatters {
  AppInputFormatters._();

  static final List<TextInputFormatter> digitsOnlyFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'\d'))
  ];
}
