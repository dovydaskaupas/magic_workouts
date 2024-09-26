// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      sets: (json['sets'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).toSet())
          .toList(),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'sets': instance.sets.map((e) => e.toList()).toList(),
    };
