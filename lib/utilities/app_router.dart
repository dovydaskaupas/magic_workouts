import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_workouts/enums/app_routes.dart';
import 'package:magic_workouts/screens/error/error_screen.dart';
import 'package:magic_workouts/screens/home/home_screen.dart';
import 'package:magic_workouts/screens/new_workout/new_workout_screen.dart';
import 'package:magic_workouts/screens/workout_list/workout_list_screen.dart';

class AppRouter {
  static final AppRouter _singleton = AppRouter._internal();
  AppRouter._internal();
  static AppRouter get instance => _singleton;

  GoRouter get router {
    return GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'root'),
      initialLocation: AppRoutes.home.path,
      errorBuilder: (context, state) => ErrorScreen(error: state.error),
      routes: [
        GoRoute(
          name: AppRoutes.home.name,
          path: AppRoutes.home.path,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: AppRoutes.newWorkout.name,
          path: AppRoutes.newWorkout.path,
          builder: (context, state) => const NewWorkoutScreen(),
        ),
        GoRoute(
          name: AppRoutes.workoutList.name,
          path: AppRoutes.workoutList.path,
          builder: (context, state) => const WorkoutListScreen(),
        ),
      ],
    );
  }
}
