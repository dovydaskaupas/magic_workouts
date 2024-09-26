import 'package:flutter/material.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:magic_workouts/utilities/text_theme_extension.dart';

class WorkoutSetItem extends StatelessWidget {
  const WorkoutSetItem({
    super.key,
    required this.index,
    required this.workoutSet,
    required this.onDelete,
  });

  final int index;
  final WorkoutSet workoutSet;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      title: Text("${workoutSet.exercise}"),
      subtitle: Text("${workoutSet.weight}kg x ${workoutSet.repetitions}reps"),
      leading: Text(
        "${index + 1}",
        style: theme.textTheme.title.copyWith(fontSize: 16),
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon: Icon(
          Icons.delete,
          color: theme.colorScheme.error,
        ),
      ),
    );
  }
}
