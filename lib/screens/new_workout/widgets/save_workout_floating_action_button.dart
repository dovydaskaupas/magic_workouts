import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/providers/workout_notifier_provider/workout_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_count_notifier_provider/workout_set_count_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/utilities/app_storage_service.dart';
import 'package:magic_workouts/widgets/modals/input_dialog.dart';

class SaveWorkoutFloatingActionButton extends ConsumerWidget {
  const SaveWorkoutFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setCount = ref.watch(workoutSetCountNotifierProvider);
    if (setCount == 0) return const SizedBox();

    return FloatingActionButton(
      onPressed: () => _saveWorkout(context, ref),
      child: const Icon(Icons.add),
    );
  }

  void _saveWorkout(final BuildContext context, final WidgetRef ref) async {
    final String? workoutName = await InputDialog(context).show(
      title: AppStrings.titleNewWorkout,
      labelText: AppStrings.newWorkoutName,
      maxLength: UIProperties.lengthInputGeneric,
    );
    if (workoutName == null) return;

    final Workout workout = ref.read(workoutNotifierProvider);

    await AppStorageService.instance.saveWorkout(workout.copyWith(
      name: workoutName,
      date: DateTime.now(),
    ));

    ref.read(workoutSetNotifierProvider.notifier).reset();
    ref.read(workoutNotifierProvider.notifier).reset();
  }
}
