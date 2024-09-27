import 'package:magic_workouts/models/workout/workout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_list_notifier_provider.g.dart';

@riverpod
class WorkoutListNotifier extends _$WorkoutListNotifier {
  @override
  List<Workout> build() {
    return [];
  }

  void addList(final List<Workout> workoutList) {
    state = workoutList;
  }

  void removeWorkout(final Workout workout) {
    final List<Workout> workoutList = List.from(state);

    workoutList.removeWhere((w) => w.date == workout.date);

    state = workoutList;
  }
}
