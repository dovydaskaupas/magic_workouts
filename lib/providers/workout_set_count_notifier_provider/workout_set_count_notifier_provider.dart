import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_set_count_notifier_provider.g.dart';

@riverpod
class WorkoutSetCountNotifier extends _$WorkoutSetCountNotifier {
  @override
  int build() {
    return 0;
  }

  void addSet(final WidgetRef ref) {
    ref.read(workoutSetNotifierProvider.notifier).reset();

    state = state + 1;
  }

  void deleteSet() {
    state = state - 1;
  }

  void init(final int count) {
    state = count;
  }
}
