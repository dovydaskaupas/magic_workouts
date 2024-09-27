// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetImpl _$$WorkoutSetImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSetImpl(
      exercise: json['exercise'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      repetitions: (json['repetitions'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$WorkoutSetImplToJson(_$WorkoutSetImpl instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'weight': instance.weight,
      'repetitions': instance.repetitions,
      'date': instance.date?.toIso8601String(),
    };
