import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/ui_properties.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.enabled,
    required this.onPressed,
  });

  final bool? enabled;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled == true ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: UIProperties.paddingText,
        ),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
