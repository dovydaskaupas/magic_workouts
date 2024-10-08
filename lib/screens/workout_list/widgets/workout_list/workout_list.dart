import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/enums/app_routes.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/providers/workout_list_notifier_provider/workout_list_notifier_provider.dart';
import 'package:magic_workouts/utilities/app_storage_service.dart';
import 'package:magic_workouts/widgets/custom_list/custom_list_view.dart';
import 'package:magic_workouts/widgets/modals/confirm_dialog.dart';

import 'workout_list_item.dart';

class WorkoutList extends ConsumerWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Workout> workoutList = ref.watch(workoutListNotifierProvider);

    return CustomListView(
      label: AppStrings.titleWorkoutList,
      hint: AppStrings.genTapToSelect,
      itemCount: workoutList.length,
      itemBuilder: (context, index) {
        final Workout workout = workoutList[index];

        return WorkoutListItem(
          index: index,
          workout: workout,
          onEdit: () => _editWorkout(context, workout),
          onDelete: () => _deleteWorkout(context, ref, workout),
        );
      },
    );
  }

  void _editWorkout(final BuildContext context, final Workout workout) {
    final String workoutDate = workout.date.toString();
    final String query = "?workoutDate=$workoutDate";

    context.push("${AppRoutes.newWorkout.path}$query");
  }

  void _deleteWorkout(
    final BuildContext context,
    final WidgetRef ref,
    final Workout workout,
  ) async {
    final bool confirmed = await ConfirmDialog(context).show(
      title: AppStrings.workoutDeleteTitle,
      message: AppStrings.workoutDeleteMessage,
    );
    if (!confirmed) return;

    await AppStorageService.instance.removeWorkout(workout);

    ref.read(workoutListNotifierProvider.notifier).removeWorkout(workout);
  }
}
