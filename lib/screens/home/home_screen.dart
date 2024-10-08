import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/ui_properties.dart';
import 'package:magic_workouts/constants/widget_keys.dart';
import 'package:magic_workouts/enums/app_routes.dart';
import 'package:magic_workouts/screens/home/widgets/workout_card.dart';
import 'package:magic_workouts/widgets/custom_app_bar.dart';
import 'package:magic_workouts/widgets/scrollable_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableScaffold(
      key: WidgetKeys.keyHomeScreen,
      appBar: const CustomAppBar(
        key: WidgetKeys.keyCustomAppBar,
        title: AppStrings.titleHome,
      ),
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: double.maxFinite),
        WorkoutCard(
          key: WidgetKeys.keyNewWorkoutCard,
          title: AppStrings.titleNewWorkout,
          message: AppStrings.homeCardNewMessage,
          icon: Icons.fitness_center,
          onTap: () => _openNewWorkoutScreen(context),
        ),
        const SizedBox(height: UIProperties.paddingCard),
        WorkoutCard(
          key: WidgetKeys.keyWorkoutListCard,
          title: AppStrings.titleWorkoutList,
          message: AppStrings.homeCardWorkoutsMessage,
          icon: Icons.history,
          onTap: () => _openYourWorkoutsScreen(context),
        ),
      ],
    );
  }

  void _openNewWorkoutScreen(final BuildContext context) {
    context.push(AppRoutes.newWorkout.path);
  }

  void _openYourWorkoutsScreen(final BuildContext context) {
    context.push(AppRoutes.workoutList.path);
  }
}
