import 'dart:async';

import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/utilities/app_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_loader_provider.g.dart';

@riverpod
class WorkoutLoader extends _$WorkoutLoader {
  @override
  FutureOr<Workout?> build(final String date) async {
    final Workout? workout = await _getWorkoutByDate(date);

    return workout;
  }

  Future<Workout?> _getWorkoutByDate(final String date) async {
    return await AppStorageService.instance.getWorkoutByDate(date);
  }
}
