// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_loader_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutLoaderHash() => r'7662853a4addc687b081dce0d9253cff83e146f2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WorkoutLoader
    extends BuildlessAutoDisposeAsyncNotifier<Workout?> {
  late final String date;

  FutureOr<Workout?> build(
    String date,
  );
}

/// See also [WorkoutLoader].
@ProviderFor(WorkoutLoader)
const workoutLoaderProvider = WorkoutLoaderFamily();

/// See also [WorkoutLoader].
class WorkoutLoaderFamily extends Family<AsyncValue<Workout?>> {
  /// See also [WorkoutLoader].
  const WorkoutLoaderFamily();

  /// See also [WorkoutLoader].
  WorkoutLoaderProvider call(
    String date,
  ) {
    return WorkoutLoaderProvider(
      date,
    );
  }

  @override
  WorkoutLoaderProvider getProviderOverride(
    covariant WorkoutLoaderProvider provider,
  ) {
    return call(
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutLoaderProvider';
}

/// See also [WorkoutLoader].
class WorkoutLoaderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WorkoutLoader, Workout?> {
  /// See also [WorkoutLoader].
  WorkoutLoaderProvider(
    String date,
  ) : this._internal(
          () => WorkoutLoader()..date = date,
          from: workoutLoaderProvider,
          name: r'workoutLoaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutLoaderHash,
          dependencies: WorkoutLoaderFamily._dependencies,
          allTransitiveDependencies:
              WorkoutLoaderFamily._allTransitiveDependencies,
          date: date,
        );

  WorkoutLoaderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final String date;

  @override
  FutureOr<Workout?> runNotifierBuild(
    covariant WorkoutLoader notifier,
  ) {
    return notifier.build(
      date,
    );
  }

  @override
  Override overrideWith(WorkoutLoader Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkoutLoaderProvider._internal(
        () => create()..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WorkoutLoader, Workout?>
      createElement() {
    return _WorkoutLoaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutLoaderProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorkoutLoaderRef on AutoDisposeAsyncNotifierProviderRef<Workout?> {
  /// The parameter `date` of this provider.
  String get date;
}

class _WorkoutLoaderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WorkoutLoader, Workout?>
    with WorkoutLoaderRef {
  _WorkoutLoaderProviderElement(super.provider);

  @override
  String get date => (origin as WorkoutLoaderProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
