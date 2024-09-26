import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:magic_workouts/models/workout_set/workout_set.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    String? name,
    DateTime? date,
    required final List<WorkoutSet> sets,
  }) = _Workout;

  factory Workout.fromJson(final Map<String, Object?> json) =>
      _$WorkoutFromJson(json);
}
