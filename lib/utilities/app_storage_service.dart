import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:magic_workouts/constants/tokens.dart';
import 'package:magic_workouts/models/workout/workout.dart';

class AppStorageService {
  late final FlutterSecureStorage _secureStorage;

  static final AppStorageService _appStorage = AppStorageService._internal(
    const FlutterSecureStorage(),
  );
  AppStorageService._internal(this._secureStorage);
  static AppStorageService get instance => _appStorage;

  Future<void> saveWorkout(final Workout workout) async {
    final List<Workout> workoutList = await _getWorkoutList();

    workoutList.add(workout);

    await _secureStorage.write(
      key: Tokens.workoutToken,
      value: jsonEncode(workoutList),
    );
  }

  Future<void> updateWorkout(final Workout workout) async {
    final List<Workout> workoutList = await _getWorkoutList();

    final int index = workoutList.indexWhere((w) => w.date == workout.date);
    if (index == -1) return;

    workoutList[index] = workout;

    await _secureStorage.write(
      key: Tokens.workoutToken,
      value: jsonEncode(workoutList),
    );
  }

  Future<void> removeWorkout(final Workout workout) async {
    final List<Workout> workoutList = await _getWorkoutList();

    final int index = workoutList.indexWhere((w) => w.date == workout.date);
    if (index == -1) return;

    workoutList.removeAt(index);

    await _secureStorage.write(
      key: Tokens.workoutToken,
      value: jsonEncode(workoutList),
    );
  }

  Future<List<Workout>> getSavedWorkouts() async {
    return await _getWorkoutList();
  }

  Future<List<Workout>> _getWorkoutList() async {
    final String? workoutListData = await _secureStorage.read(
      key: Tokens.workoutToken,
    );

    if (workoutListData == null) return [];

    final List<dynamic> listData = jsonDecode(workoutListData);
    return listData.map((data) => Workout.fromJson(data)).toList();
  }

  Future<Workout?> getWorkoutByDate(final String date) async {
    final List<Workout> workouts = await _getWorkoutList();

    for (final Workout workout in workouts) {
      if (workout.date.toString() == date) {
        return workout;
      }
    }

    return null;
  }
}
