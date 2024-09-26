import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:magic_workouts/screens/new_workout/widgets/workout_set_list/workout_set_item.dart';

class WorkoutSetList extends StatelessWidget {
  const WorkoutSetList({
    super.key,
    required this.workoutSetList,
  });

  final List<WorkoutSet> workoutSetList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UIProperties.paddingGeneric,
      ),
      child: ListView.separated(
        itemCount: workoutSetList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return WorkoutSetItem(
            index: index,
            workoutSet: workoutSetList[index],
            onDelete: () => _deleteWorkoutSet(index),
          );
        },
        separatorBuilder: (_, __) => const Divider(thickness: 1),
      ),
    );
  }

  void _deleteWorkoutSet(final int index) {}
}
