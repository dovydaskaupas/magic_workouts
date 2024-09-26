import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/screens/new_workout/widgets/exercise_dropdown_button.dart';
import 'package:magic_workouts/screens/new_workout/widgets/repetitions_input_field.dart';
import 'package:magic_workouts/screens/new_workout/widgets/save_workout_button.dart';
import 'package:magic_workouts/screens/new_workout/widgets/weight_input_field.dart';
import 'package:magic_workouts/screens/new_workout/widgets/workout_set_list/workout_set_list.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/scrollable_scaffold.dart';

class NewWorkoutScreen extends ConsumerWidget {
  const NewWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ScrollableScaffold(
      appBar: CustomAppBar(title: AppStrings.homeCardNewTitle),
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
}
