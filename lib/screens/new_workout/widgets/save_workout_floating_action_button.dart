import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/providers/workout_set_count_notifier_provider/workout_set_count_notifier_provider.dart';

class SaveWorkoutFloatingActionButton extends ConsumerWidget {
  const SaveWorkoutFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setCount = ref.watch(workoutSetCountNotifierProvider);
    if (setCount == 0) return const SizedBox();

    return FloatingActionButton(
      onPressed: () => _saveWorkout(ref),
      child: const Icon(Icons.add),
    );
  }

  void _saveWorkout(final WidgetRef ref) {}
}
