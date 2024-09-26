import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_input_formatters.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/widgets/custom_text_field.dart';

class WeightInputField extends ConsumerWidget {
  const WeightInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? weight = ref.watch(workoutSetNotifierProvider).weight;

    return CustomTextField(
      value: _formatWeightValue(weight),
      inputFormatters: AppInputFormatters.digitsOnlyFormatter,
      labelText: AppStrings.newWeight,
      maxLength: 3,
      onChanged: (newValue) => _setWeight(newValue, ref),
    );
  }

  String? _formatWeightValue(final int? weight) {
    if (weight == null) return null;

    return weight.toString();
  }

  void _setWeight(final String? newValue, final WidgetRef ref) {
    final int? weight = int.tryParse(newValue ?? "");

    ref.read(workoutSetNotifierProvider.notifier).setWeight(weight);
  }
}
