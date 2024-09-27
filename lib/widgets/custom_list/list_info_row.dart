import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/utilities/text_theme_extension.dart';

class ListInfoRow extends StatelessWidget {
  const ListInfoRow({
    super.key,
    required this.label,
    required this.hint,
  });

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color primaryColour = theme.primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UIProperties.paddingGeneric,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.label.copyWith(
              fontSize: 16,
              color: primaryColour,
            ),
          ),
          const SizedBox(width: UIProperties.paddingText),
          Text(
            hint,
            style: theme.textTheme.hint.copyWith(
              fontSize: 16,
              color: primaryColour,
            ),
          ),
        ],
      ),
    );
  }
}
