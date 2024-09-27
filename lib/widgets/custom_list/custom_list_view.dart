import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/widgets/custom_list/list_info_row.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.label,
    required this.hint,
    required this.itemCount,
    required this.itemBuilder,
  });

  final String label;
  final String hint;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UIProperties.paddingGeneric,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListInfoRow(
            label: label,
            hint: hint,
          ),
          ListView.separated(
            itemCount: itemCount,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: itemBuilder,
            separatorBuilder: (_, __) => const Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
