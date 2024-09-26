import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:magic_workouts/providers/form_reset_notifier_provider/form_reset_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_notifier_provider/workout_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/widgets/buttons/custom_outlined_button.dart';

class SaveWorkoutButton extends ConsumerWidget {
  const SaveWorkoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WorkoutSet workoutSet = ref.watch(workoutSetNotifierProvider);

    return CustomOutlinedButton(
      text: AppStrings.genSave,
      enabled: _isWorkoutSetValid(workoutSet),
      onPressed: () => _saveWorkoutSet(ref, workoutSet),
    );
  }

  bool _isWorkoutSetValid(final WorkoutSet workoutSet) {
    return workoutSet.exercise != null &&
        workoutSet.weight != null &&
        workoutSet.repetitions != null;
  }

  void _saveWorkoutSet(
    final WidgetRef ref,
    final WorkoutSet workoutSet,
  ) async {
    FocusManager.instance.primaryFocus?.unfocus();

    ref.read(workoutNotifierProvider.notifier).addSet(workoutSet);
    ref.read(formResetNotifierProvider.notifier).resetForm(ref);
  }
}
