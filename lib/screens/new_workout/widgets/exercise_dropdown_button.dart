import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/providers/workout_set_count_notifier_provider/workout_set_count_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/widgets/buttons/custom_dropdown_button.dart';

class ExerciseDropdownButton extends ConsumerWidget {
  const ExerciseDropdownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(workoutSetCountNotifierProvider);
    final String? exercise = ref.read(workoutSetNotifierProvider).exercise;

    return CustomDropdownButton(
      selectedValue: exercise,
      hint: AppStrings.newExerciseDropdownHint,
      items: const [
        AppStrings.newExerciseDropdownHint,
        AppStrings.newExercise1,
        AppStrings.newExercise2,
        AppStrings.newExercise3,
        AppStrings.newExercise4,
        AppStrings.newExercise5,
      ],
      onChanged: (newValue) => _setExercise(newValue, ref),
    );
  }

  void _setExercise(final String? newValue, final WidgetRef ref) {
    ref.read(workoutSetNotifierProvider.notifier).setExercise(newValue);
  }
}
