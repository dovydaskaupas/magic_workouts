import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_set.freezed.dart';
part 'workout_set.g.dart';

@freezed
class WorkoutSet with _$WorkoutSet {
  const factory WorkoutSet({
    String? exercise,
    int? weight,
    int? repetitions,
  }) = _WorkoutSet;

  factory WorkoutSet.fromJson(final Map<String, Object?> json) =>
      _$WorkoutSetFromJson(json);
}
