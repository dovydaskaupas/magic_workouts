import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/utilities/text_theme_extension.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
  });

  final List<String> items;
  final String hint;
  final Function(String?) onChanged;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UIProperties.paddingRow,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: const BorderRadius.all(
            UIProperties.radiusDropdown,
          ),
        ),
        width: UIProperties.widthGeneric,
        child: DropdownButton<String>(
          borderRadius: const BorderRadius.all(
            UIProperties.radiusDropdown,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: UIProperties.paddingGeneric,
          ),
          dropdownColor: theme.colorScheme.secondary,
          hint: Padding(
            padding: const EdgeInsets.only(
              left: UIProperties.paddingText,
            ),
            child: Text(
              widget.hint,
              style: theme.textTheme.hint,
            ),
          ),
          iconEnabledColor: theme.colorScheme.surface,
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          underline: const SizedBox(),
          value: selectedValue,
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: item == selectedValue
                    ? theme.textTheme.label
                    : theme.textTheme.value,
              ),
            );
          }).toList(),
          onChanged: _onSelectionChanged,
        ),
      ),
    );
  }

  void _onSelectionChanged(final String? newValue) {
    setState(() => selectedValue = newValue);

    widget.onChanged(newValue);
  }
}
