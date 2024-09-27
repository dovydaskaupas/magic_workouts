import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/screens/workout_list/widgets/workout_list/workout_list.dart';
import 'package:magic_workouts/utilities/app_storage_service.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:magic_workouts/widgets/scrollable_scaffold.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            final workoutList = snapshot.data as List<Workout>;
            return WorkoutList(workoutList: workoutList);
          },
        ),
      ],
    );
  }

  Future<List<Workout>> _readWorkoutList() async {
    return await AppStorageService.instance.getSavedWorkouts();
  }
}
