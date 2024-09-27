import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/models/workout/workout.dart';

import 'workout_list_item.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({
    super.key,
    required this.workoutList,
  });

  final List<Workout> workoutList;

  @override
  Widget build(BuildContext context) {
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
