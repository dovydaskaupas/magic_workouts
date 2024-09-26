import 'package:freezed_annotation/freezed_annotation.dart';

part 'set.freezed.dart';
part 'set.g.dart';

@freezed
class Set with _$Set {
  const factory Set({
    required final String exercise,
    required final int weight,
    required final int repetitions,
  }) = _Set;

  factory Set.fromJson(final Map<String, Object?> json) => _$SetFromJson(json);
}
