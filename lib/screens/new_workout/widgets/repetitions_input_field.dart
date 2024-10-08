import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_input_formatters.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/widget_keys.dart';
import 'package:magic_workouts/providers/workout_set_count_notifier_provider/workout_set_count_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_tap_notifier_provider/workout_set_tap_notifier_provider.dart';
import 'package:magic_workouts/widgets/custom_text_field.dart';

class RepetitionsInputField extends ConsumerWidget {
  const RepetitionsInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(workoutSetCountNotifierProvider);
    ref.watch(workoutSetTapNotifierProvider);

    return CustomTextField(
      key: WidgetKeys.keyNewRepsInput,
      value: _getRepetitionsValue(ref),
      inputFormatters: AppInputFormatters.digitsOnlyFormatter,
      labelText: AppStrings.newRepetitions,
      maxLength: 4,
      onChanged: (newValue) => _setRepetitions(newValue, ref),
    );
  }

  String? _getRepetitionsValue(final WidgetRef ref) {
    final int? repetitions = ref.read(workoutSetNotifierProvider).repetitions;
    if (repetitions == null) return null;

    return repetitions.toString();
  }

  void _setRepetitions(final String? newValue, final WidgetRef ref) {
    final int? repetitions = int.tryParse(newValue ?? "");

    ref.read(workoutSetNotifierProvider.notifier).setRepetitions(repetitions);
  }
}
