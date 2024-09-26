import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_reset_notifier_provider.g.dart';

@riverpod
class FormResetNotifier extends _$FormResetNotifier {
  @override
  bool build() {
    return false;
  }

  void resetForm(final WidgetRef ref) {
    ref.read(workoutSetNotifierProvider.notifier).reset();

    state = true;
  }
}
