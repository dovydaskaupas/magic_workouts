import 'package:flutter/material.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/utilities/text_theme_extension.dart';

class WorkoutListItem extends StatelessWidget {
  const WorkoutListItem({
    super.key,
    required this.index,
    required this.workout,
    required this.onEdit,
    required this.onDelete,
  });

  final int index;
  final Workout workout;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      title: Text(workout.name ?? "-"),
      subtitle: Text(_formattedDate),
      leading: Text(
        "${index + 1}",
        style: theme.textTheme.title.copyWith(fontSize: 16),
      ),
      trailing: InkResponse(
        onTap: onDelete,
        child: const Icon(Icons.delete),
      ),
      onTap: onEdit,
    );
  }

  String get _formattedDate {
    if (workout.date == null) return "-";

    final DateTime date = workout.date!;

    return "${date.year}/${date.month}/${date.day} ${date.hour}:${date.minute}";
  }
}
