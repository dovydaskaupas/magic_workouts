import 'package:flutter/material.dart';

class CustomSnackBar {
  late final ScaffoldMessengerState _scaffoldMessengerState;

  CustomSnackBar(final BuildContext context) {
    _scaffoldMessengerState = ScaffoldMessenger.of(context);
  }

  void showSnackBar({
    required final String message,
    required final bool success,
    int? duration,
    int? delay,
  }) {
    final int milliseconds = duration ?? 4000;
    final Color color;
    final IconData icon;

    if (success) {
      color = Colors.green;
      icon = Icons.check_circle_outline;
    } else {
      color = Theme.of(_scaffoldMessengerState.context).colorScheme.error;
      icon = Icons.warning_amber_outlined;
    }

    _scaffoldMessengerState.clearSnackBars();

    Future.delayed(Duration(milliseconds: delay ?? 0), () {
      _scaffoldMessengerState.showSnackBar(SnackBar(
        duration: Duration(milliseconds: milliseconds),
        content: Row(children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Expanded(child: Text(message)),
        ]),
      ));
    });
  }

  void dismiss() {
    _scaffoldMessengerState.clearSnackBars();
  }
}
