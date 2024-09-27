import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/providers/workout_list_notifier_provider/workout_list_notifier_provider.dart';

import 'workout_list_item.dart';

class WorkoutList extends ConsumerWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Workout> workoutList = ref.watch(workoutListNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UIProperties.paddingGeneric,
      ),
      child: ListView.separated(
        itemCount: workoutList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return WorkoutListItem(
            index: index,
            workout: workoutList[index],
          );
        },
        separatorBuilder: (_, __) => const Divider(thickness: 1),
      ),
    );
  }
}
