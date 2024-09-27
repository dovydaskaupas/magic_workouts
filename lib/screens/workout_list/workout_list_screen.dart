import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/providers/workout_list_notifier_provider/workout_list_notifier_provider.dart';
import 'package:magic_workouts/screens/workout_list/widgets/workout_list/workout_list.dart';
import 'package:magic_workouts/utilities/app_storage_service.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:magic_workouts/widgets/scrollable_scaffold.dart';

class WorkoutListScreen extends ConsumerWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Future future = _readWorkoutList();

    return ScrollableScaffold(
      appBar: const CustomAppBar(title: AppStrings.homeCardWorkoutsTitle),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: double.maxFinite),
        FutureBuilder(
          future: future,
          builder: (_, final AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomCircularProgressIndicator();
            }

            _initWorkoutList(ref, snapshot.data);

            return const WorkoutList();
          },
        ),
      ],
    );
  }

  Future<List<Workout>> _readWorkoutList() async {
    return await AppStorageService.instance.getSavedWorkouts();
  }

  void _initWorkoutList(final WidgetRef ref, final List<Workout> workoutList) {
    Future.microtask(() {
      ref.read(workoutListNotifierProvider.notifier).addList(workoutList);
    });
  }
}
