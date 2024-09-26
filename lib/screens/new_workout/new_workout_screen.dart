import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_input_formatters.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/providers/workout_set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/screens/new_workout/widgets/exercise_dropdown_button.dart';
import 'package:magic_workouts/screens/new_workout/widgets/save_workout_button.dart';
import 'package:magic_workouts/screens/new_workout/widgets/weight_input_field.dart';
import 'package:magic_workouts/screens/new_workout/widgets/workout_set_list/workout_set_list.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/custom_text_field.dart';
import 'package:magic_workouts/widgets/scrollable_scaffold.dart';

class NewWorkoutScreen extends ConsumerWidget {
  const NewWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollableScaffold(
      appBar: const CustomAppBar(title: AppStrings.homeCardNewTitle),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: UIProperties.paddingGeneric,
          width: double.maxFinite,
        ),
        const ExerciseDropdownButton(),
        const WeightInputField(),
        CustomTextField(
          inputFormatters: AppInputFormatters.digitsOnlyFormatter,
          labelText: AppStrings.newRepetitions,
          maxLength: 4,
          onChanged: (newValue) => _setRepetitions(newValue, ref),
        ),
        const SaveWorkoutButton(),
        const WorkoutSetList(),
        const SizedBox(width: UIProperties.paddingGeneric),
      ],
    );
  }

  void _setRepetitions(final String? newValue, final WidgetRef ref) {
    final int? repetitions = int.tryParse(newValue ?? "");

    ref.read(workoutSetNotifierProvider.notifier).setRepetitions(repetitions);
  }
}
