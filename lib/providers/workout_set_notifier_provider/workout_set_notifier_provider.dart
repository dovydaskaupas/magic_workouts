import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_set_notifier_provider.g.dart';

@riverpod
class WorkoutSetNotifier extends _$WorkoutSetNotifier {
  @override
  WorkoutSet build() {
    return const WorkoutSet();
  }

  void setExercise(final String? exercise) {
    state = state.copyWith(exercise: exercise);
  }

  void setWeight(final int? weight) {
    state = state.copyWith(weight: weight);
  }

  void setRepetitions(final int? repetitions) {
    state = state.copyWith(repetitions: repetitions);
  }

  void reset() {
    state = const WorkoutSet();
  }

  void init(final WorkoutSet workoutSet) {
    state = workoutSet;
  }
}
