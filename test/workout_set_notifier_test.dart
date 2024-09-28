import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';

void main() {
  group("Testing every single method in the WorkoutSetNotifier provider", () {
    late ProviderContainer container;
    late WorkoutSetNotifier notifier;

    setUp(() {
      container = ProviderContainer();
      notifier = container.read(workoutSetNotifierProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test("Initial state should be an empty WorkoutSet", () {
      expect(notifier.state, const WorkoutSet());
    });

    test("'setExercise' should update the exercise value in the state", () {
      notifier.setExercise("Bench Press");

      expect(notifier.state.exercise, "Bench Press");
    });

    test("'setWeight' should update the weight in the state", () {
      notifier.setWeight(80);

      expect(notifier.state.weight, 80);
    });

    test("'setRepetitions' should update the repetitions count in the state",
        () {
      notifier.setRepetitions(10);

      expect(notifier.state.repetitions, 10);
    });

    test("'reset' should return the state to an empty WorkoutSet", () {
      notifier.setExercise("Squat");
      notifier.setWeight(80);
      notifier.setRepetitions(10);
      notifier.reset();

      expect(notifier.state, const WorkoutSet());
    });

    test("'init' should set the state to the specified WorkoutSet", () {
      const WorkoutSet workoutSet = WorkoutSet(
        exercise: "Dead-lift",
        weight: 120,
        repetitions: 5,
      );

      notifier.init(workoutSet);

      expect(notifier.state, workoutSet);
    });
  });
}
