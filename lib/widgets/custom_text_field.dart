import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_workouts/constants/ui_properties.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.value,
    this.maxLength,
    this.inputFormatters,
    required this.onChanged,
  });

  final String labelText;
  final String? value;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: value);
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UIProperties.paddingRow,
      ),
      child: SizedBox(
        width: UIProperties.widthGeneric,
        child: TextField(
          style: TextStyle(
            color: theme.colorScheme.secondary,
            decoration: TextDecoration.underline,
            decorationColor: theme.colorScheme.secondary,
          ),
          inputFormatters: inputFormatters,
          keyboardType: TextInputType.number,
          maxLength: maxLength,
          decoration: InputDecoration(
            labelText: labelText,
            isDense: true,
            suffix: InkResponse(
              onTap: () => _clearInput(controller),
              child: Icon(
                Icons.clear,
                color: theme.primaryColor,
              ),
            ),
          ),
          controller: controller,
          onChanged: onChanged,
        ),
      ),
    );
  }

  void _clearInput(final TextEditingController controller) {
    controller.clear();

    onChanged(null);
  }
}
