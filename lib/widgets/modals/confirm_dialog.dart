import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';

class ConfirmDialog {
  late final BuildContext _context;

  ConfirmDialog(final BuildContext context) : _context = context;

  Future<bool> show({
    required final String title,
    required final String message,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final bool? result = await showDialog<bool>(
      context: _context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        scrollable: true,
        title: Text(title),
        content: Padding(
          padding: const EdgeInsets.only(
            left: UIProperties.paddingText,
            top: UIProperties.paddingText,
            right: UIProperties.paddingText,
          ),
          child: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(dialogContext).pop,
            child: const Text(AppStrings.genCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text(AppStrings.genConfirm),
          ),
        ],
      ),
    );

    return result ?? false;
  }
}
