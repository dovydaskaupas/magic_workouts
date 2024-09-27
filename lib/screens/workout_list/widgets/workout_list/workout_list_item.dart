import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_workouts/enums/app_routes.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/utilities/text_theme_extension.dart';

class WorkoutListItem extends ConsumerWidget {
  const WorkoutListItem({
    super.key,
    required this.index,
    required this.workout,
  });

  final int index;
  final Workout workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      title: Text(workout.name ?? "-"),
      subtitle: Text(_formattedDate),
      leading: Text(
        "${index + 1}",
        style: theme.textTheme.title.copyWith(fontSize: 16),
      ),
      trailing: InkResponse(
        onTap: () => _deleteWorkout(ref),
        child: const Icon(Icons.delete),
      ),
      onTap: () => _editWorkout(context),
    );
  }

  String get _formattedDate {
    if (workout.date == null) return "-";

    final DateTime date = workout.date!;

    return "${date.year}/${date.month}/${date.day} ${date.hour}:${date.minute}";
  }

  void _editWorkout(final BuildContext context) {
    final String workoutDate = workout.date.toString();
    final String query = "?workoutDate=$workoutDate";

    context.push("${AppRoutes.newWorkout.path}$query");
  }

  void _deleteWorkout(final WidgetRef ref) {}
}
