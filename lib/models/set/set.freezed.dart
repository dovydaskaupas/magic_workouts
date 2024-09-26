// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Set _$SetFromJson(Map<String, dynamic> json) {
  return _Set.fromJson(json);
}

/// @nodoc
mixin _$Set {
  String get exercise => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int get repetitions => throw _privateConstructorUsedError;

  /// Serializes this Set to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetCopyWith<Set> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetCopyWith<$Res> {
  factory $SetCopyWith(Set value, $Res Function(Set) then) =
      _$SetCopyWithImpl<$Res, Set>;
  @useResult
  $Res call({String exercise, int weight, int repetitions});
}

/// @nodoc
class _$SetCopyWithImpl<$Res, $Val extends Set> implements $SetCopyWith<$Res> {
  _$SetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? weight = null,
    Object? repetitions = null,
  }) {
    return _then(_value.copyWith(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetImplCopyWith<$Res> implements $SetCopyWith<$Res> {
  factory _$$SetImplCopyWith(_$SetImpl value, $Res Function(_$SetImpl) then) =
      __$$SetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String exercise, int weight, int repetitions});
}

/// @nodoc
class __$$SetImplCopyWithImpl<$Res> extends _$SetCopyWithImpl<$Res, _$SetImpl>
    implements _$$SetImplCopyWith<$Res> {
  __$$SetImplCopyWithImpl(_$SetImpl _value, $Res Function(_$SetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? weight = null,
    Object? repetitions = null,
  }) {
    return _then(_$SetImpl(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetImpl implements _Set {
  const _$SetImpl(
      {required this.exercise,
      required this.weight,
      required this.repetitions});

  factory _$SetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetImplFromJson(json);

  @override
  final String exercise;
  @override
  final int weight;
  @override
  final int repetitions;

  @override
  String toString() {
    return 'Set(exercise: $exercise, weight: $weight, repetitions: $repetitions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.repetitions, repetitions) ||
                other.repetitions == repetitions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exercise, weight, repetitions);

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetImplCopyWith<_$SetImpl> get copyWith =>
      __$$SetImplCopyWithImpl<_$SetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetImplToJson(
      this,
    );
  }
}

abstract class _Set implements Set {
  const factory _Set(
      {required final String exercise,
      required final int weight,
      required final int repetitions}) = _$SetImpl;

  factory _Set.fromJson(Map<String, dynamic> json) = _$SetImpl.fromJson;

  @override
  String get exercise;
  @override
  int get weight;
  @override
  int get repetitions;

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetImplCopyWith<_$SetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
