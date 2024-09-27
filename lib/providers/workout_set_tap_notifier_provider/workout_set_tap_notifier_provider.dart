import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_set_tap_notifier_provider.g.dart';

@riverpod
class WorkoutSetTapNotifier extends _$WorkoutSetTapNotifier {
  @override
  bool build() {
    return false;
  }

  void notifyTap() {
    state = !state;
  }
}
