import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:magic_workouts/providers/workout_notifier_provider/workout_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_count_notifier_provider/workout_set_count_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_tap_notifier_provider/workout_set_tap_notifier_provider.dart';
import 'package:magic_workouts/screens/new_workout/widgets/workout_set_list/workout_set_item.dart';
import 'package:magic_workouts/widgets/custom_list/custom_list_view.dart';

class WorkoutSetList extends ConsumerWidget {
  const WorkoutSetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutProvider = ref.watch(workoutNotifierProvider);

    return CustomListView(
      label: AppStrings.newWorkoutSets,
      hint: AppStrings.genTapToSelect,
      itemCount: workoutProvider.sets.length,
      itemBuilder: (context, index) {
        return WorkoutSetItem(
          index: index,
          workoutSet: workoutProvider.sets[index],
          onTap: () => _initWorkoutSet(
            ref,
            workoutProvider.sets[index],
          ),
          onDelete: () => _removeWorkoutSet(
            ref,
            workoutProvider.sets[index],
          ),
        );
      },
    );
  }

  void _initWorkoutSet(final WidgetRef ref, final WorkoutSet workoutSet) {
    ref.read(workoutSetNotifierProvider.notifier).init(workoutSet);
    ref.read(workoutSetTapNotifierProvider.notifier).notifyTap();
  }

  void _removeWorkoutSet(final WidgetRef ref, final WorkoutSet workoutSet) {
    ref.read(workoutNotifierProvider.notifier).removeSet(workoutSet);
    ref.read(workoutSetCountNotifierProvider.notifier).deleteSet();
  }
}
