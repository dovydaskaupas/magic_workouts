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
      width: UIProperties.widthGeneric,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: UIProperties.elevationCard,
        margin: const EdgeInsets.all(UIProperties.paddingGeneric),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(UIProperties.radiusGeneric),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: UIProperties.paddingCard,
              horizontal: UIProperties.paddingGeneric,
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
                      style: theme.textTheme.cardTitle,
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
