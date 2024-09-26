import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/app_input_formatters.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/custom_dropdown_button.dart';
import 'package:magic_workouts/widgets/custom_text_field.dart';
import 'package:magic_workouts/widgets/scrollable_scaffold.dart';

class NewWorkoutScreen extends StatelessWidget {
  const NewWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          onChanged: (newValue) {},
        ),
        CustomTextField(
          inputFormatters: AppInputFormatters.digitsOnlyFormatter,
          labelText: AppStrings.newWeight,
          maxLength: 3,
          onChanged: (newValue) {},
        ),
        const SizedBox(width: UIProperties.paddingGeneric),
      ],
    );
  }
}
