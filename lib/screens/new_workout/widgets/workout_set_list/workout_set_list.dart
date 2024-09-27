import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:magic_workouts/providers/workout_notifier_provider/workout_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_count_notifier_provider/workout_set_count_notifier_provider.dart';
import 'package:magic_workouts/screens/new_workout/widgets/workout_set_list/workout_set_item.dart';

class WorkoutSetList extends ConsumerWidget {
  const WorkoutSetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutProvider = ref.watch(workoutNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UIProperties.paddingGeneric,
      ),
      child: ListView.separated(
        itemCount: workoutProvider.sets.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return WorkoutSetItem(
            index: index,
            workoutSet: workoutProvider.sets[index],
            onDelete: () => _removeWorkoutSet(
              ref,
              workoutProvider.sets[index],
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(thickness: 1),
      ),
    );
  }

  void _removeWorkoutSet(final WidgetRef ref, final WorkoutSet set) {
    ref.read(workoutNotifierProvider.notifier).removeSet(set);
    ref.read(workoutSetCountNotifierProvider.notifier).deleteSet();
  }
}
