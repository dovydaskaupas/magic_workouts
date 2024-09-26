import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/widgets/custom_app_bar/custom_app_bar.dart';

class NewWorkoutScreen extends StatelessWidget {
  const NewWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: AppStrings.titleNewWorkout),
      body: Center(
        child: Text(AppStrings.titleNewWorkout),
      ),
    );
  }
}
