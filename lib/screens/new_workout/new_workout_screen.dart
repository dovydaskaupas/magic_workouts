import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic_workouts/constants/app_input_formatters.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/providers/set_notifier_provider/workout_set_notifier_provider.dart';
import 'package:magic_workouts/screens/new_workout/widgets/save_workout_button.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/custom_dropdown_button.dart';
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
        const SizedBox(width: double.maxFinite),
        CustomDropdownButton(
          hint: AppStrings.newExerciseDropdownHint,
          items: const [
            AppStrings.newExercise1,
            AppStrings.newExercise2,
            AppStrings.newExercise3,
            AppStrings.newExercise4,
            AppStrings.newExercise5,
          ],
          onChanged: (newValue) => _setExercise(newValue, ref),
        ),
        CustomTextField(
          inputFormatters: AppInputFormatters.digitsOnlyFormatter,
          labelText: AppStrings.newWeight,
          maxLength: 3,
          onChanged: (newValue) => _setWeight(newValue, ref),
        ),
        CustomTextField(
          inputFormatters: AppInputFormatters.digitsOnlyFormatter,
          labelText: AppStrings.newRepetitions,
          maxLength: 4,
          onChanged: (newValue) => _setRepetitions(newValue, ref),
        ),
        const SaveWorkoutButton(),
        const SizedBox(width: UIProperties.paddingGeneric),
      ],
    );
  }

  void _setExercise(final String? newValue, final WidgetRef ref) {
    ref.read(workoutSetNotifierProvider.notifier).setExercise(newValue);
  }

  void _setWeight(final String? newValue, final WidgetRef ref) {
    final int? weight = int.tryParse(newValue ?? "");

    ref.read(workoutSetNotifierProvider.notifier).setWeight(weight);
  }

  void _setRepetitions(final String? newValue, final WidgetRef ref) {
    final int? repetitions = int.tryParse(newValue ?? "");

    ref.read(workoutSetNotifierProvider.notifier).setRepetitions(repetitions);
  }
}
