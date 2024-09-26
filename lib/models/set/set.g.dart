// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetImpl _$$SetImplFromJson(Map<String, dynamic> json) => _$SetImpl(
      exercise: json['exercise'] as String,
      weight: (json['weight'] as num).toInt(),
      repetitions: (json['repetitions'] as num).toInt(),
    );

Map<String, dynamic> _$$SetImplToJson(_$SetImpl instance) => <String, dynamic>{
      'exercise': instance.exercise,
      'weight': instance.weight,
      'repetitions': instance.repetitions,
    };
