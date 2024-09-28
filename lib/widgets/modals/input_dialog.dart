import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/constants/widget_keys.dart';

class InputDialog {
  late final BuildContext _context;
  late final TextEditingController _controller;

  InputDialog(
    final BuildContext context, {
    final String? value,
  }) {
    _context = context;
    _controller = TextEditingController(text: value);
  }

  Future<String?> show({
    required final String title,
    required final String labelText,
    required final int maxLength,
  }) async {
    return await showDialog<String?>(
      context: _context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        contentPadding: const EdgeInsets.only(
          left: UIProperties.paddingText,
          right: UIProperties.paddingText,
          top: UIProperties.paddingGeneric,
        ),
        title: Text(title),
        content: SizedBox(
          width: UIProperties.widthGeneric,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UIProperties.paddingGeneric,
            ),
            child: TextField(
              key: WidgetKeys.keyInputDialog,
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: labelText,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _controller.clear,
                ),
              ),
              maxLength: maxLength,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(dialogContext).pop,
            child: const Text(AppStrings.genCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(_controller.text),
            child: const Text(AppStrings.genConfirm),
          ),
        ],
      ),
    );
  }
}
