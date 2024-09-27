import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_notifier_provider.g.dart';

@riverpod
class WorkoutNotifier extends _$WorkoutNotifier {
  @override
  Workout build() {
    return const Workout(sets: []);
  }

  void addSet(final WorkoutSet set) {
    state = state.copyWith(sets: [...state.sets, set]);
  }

  void removeSet(final WorkoutSet set) {
    final List<WorkoutSet> updatedList = List.from(state.sets);

    updatedList.remove(set);

    state = state.copyWith(sets: updatedList);
  }

  void setName(final String name) {
    state = state.copyWith(name: name);
  }

  void setDate() {
    state = state.copyWith(date: DateTime.now());
  }

  void reset() {
    state = const Workout(sets: []);
  }

  void init(final Workout workout) {
    state = workout;
  }
}
