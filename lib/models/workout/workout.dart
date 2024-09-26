import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    required final String name,
    required final DateTime date,
    required final List<Set> sets,
  }) = _Workout;

  factory Workout.fromJson(final Map<String, Object?> json) =>
      _$WorkoutFromJson(json);
}
