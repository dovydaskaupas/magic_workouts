import 'package:flutter/material.dart';
import 'package:magic_workouts/models/workout/workout.dart';

class WorkoutListItem extends StatelessWidget {
  const WorkoutListItem({
    super.key,
    required this.index,
    required this.workout,
  });

  final int index;
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(workout.name ?? "-"),
      subtitle: Text(_formattedDate),
      leading: Text("${index + 1}"),
    );
  }

  String get _formattedDate {
    if (workout.date == null) return "-";

    final DateTime date = workout.date!;

    return "${date.year}/${date.month}/${date.day} ${date.hour}:${date.minute}";
  }
}
