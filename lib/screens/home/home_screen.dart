import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/screens/home/widgets/workout_card.dart';
import 'package:magic_workouts/widgets/custom_app_bar/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.titleHome),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: double.maxFinite),
          WorkoutCard(
            title: AppStrings.homeCardNewTitle,
            message: AppStrings.homeCardNewMessage,
            icon: Icons.fitness_center,
            onTap: _openNewWorkoutScreen,
          ),
          const SizedBox(height: UIProperties.paddingCard),
          WorkoutCard(
            title: AppStrings.homeCardWorkoutsTitle,
            message: AppStrings.homeCardWorkoutsMessage,
            icon: Icons.history,
            onTap: _openYourWorkoutsScreen,
          ),
        ],
      ),
    );
  }

  void _openNewWorkoutScreen() {}

  void _openYourWorkoutsScreen() {}
}
