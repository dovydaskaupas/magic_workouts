import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/models/set/workout_set.dart';
import 'package:magic_workouts/providers/set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/widgets/custom_outlined_button.dart';

class SaveWorkoutButton extends ConsumerWidget {
  const SaveWorkoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WorkoutSet workoutSet = ref.watch(workoutSetNotifierProvider);

    return CustomOutlinedButton(
      text: AppStrings.genSave,
      enabled: _isWorkoutSetValid(workoutSet),
      onPressed: () => _addWorkoutSet(workoutSet),
    );
  }

  bool _isWorkoutSetValid(final WorkoutSet workoutSet) {
    return workoutSet.exercise != null &&
        workoutSet.weight != null &&
        workoutSet.repetitions != null;
  }

  void _addWorkoutSet(final WorkoutSet workoutSet) {}
}
