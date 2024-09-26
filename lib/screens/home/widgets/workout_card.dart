import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/utilities/text_theme_extension.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String message;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: UIProperties.widthCard,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.grey.shade800,
        margin: const EdgeInsets.all(UIProperties.paddingGeneric),
        elevation: UIProperties.elevationCard,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.maxFinite),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.label,
                    ),
                    Icon(icon),
                  ],
                ),
                const SizedBox(height: UIProperties.paddingText),
                Text(
                  message,
                  style: theme.textTheme.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
