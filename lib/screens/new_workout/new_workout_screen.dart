import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/constants/widget_keys.dart';
import 'package:magic_workouts/models/workout/workout.dart';
import 'package:magic_workouts/providers/workout_loader_provider/workout_loader_provider.dart';
import 'package:magic_workouts/providers/workout_notifier_provider/workout_notifier_provider.dart';
import 'package:magic_workouts/providers/workout_set_count_notifier_provider/workout_set_count_notifier_provider.dart';
import 'package:magic_workouts/screens/new_workout/widgets/exercise_dropdown_button.dart';
import 'package:magic_workouts/screens/new_workout/widgets/repetitions_input_field.dart';
import 'package:magic_workouts/screens/new_workout/widgets/save_workout_button.dart';
import 'package:magic_workouts/screens/new_workout/widgets/save_workout_floating_action_button.dart';
import 'package:magic_workouts/screens/new_workout/widgets/weight_input_field.dart';
import 'package:magic_workouts/screens/new_workout/widgets/workout_set_list/workout_set_list.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:magic_workouts/widgets/scrollable_scaffold.dart';

class NewWorkoutScreen extends ConsumerWidget {
  const NewWorkoutScreen({
    super.key,
    this.workoutDate,
  });

  final String? workoutDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (workoutDate == null) return _newWorkoutContent;

    final workoutAsync = ref.watch(workoutLoaderProvider(workoutDate!));
    return workoutAsync.when(
      data: (final Workout? workout) {
        _initWorkout(ref, workout);

        return _newWorkoutContent;
      },
      error: (error, stackTrace) => _newWorkoutContent,
      loading: () => const CustomCircularProgressIndicator(),
    );
  }

  Widget get _newWorkoutContent {
    return const ScrollableScaffold(
      key: WidgetKeys.keyNewWorkoutScreen,
      appBar: CustomAppBar(title: AppStrings.homeCardNewTitle),
      floatingActionButton: SaveWorkoutFloatingActionButton(),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: UIProperties.paddingGeneric,
          width: double.maxFinite,
        ),
        ExerciseDropdownButton(),
        WeightInputField(),
        RepetitionsInputField(),
        SaveWorkoutButton(),
        WorkoutSetList(),
        SizedBox(width: UIProperties.paddingGeneric),
      ],
    );
  }

  void _initWorkout(final WidgetRef ref, final Workout? workout) {
    if (workout == null) return;

    Future.microtask(() {
      ref.read(workoutNotifierProvider.notifier).init(workout);

      final int setsCount = workout.sets.length;
      ref.read(workoutSetCountNotifierProvider.notifier).init(setsCount);
    });
  }
}
