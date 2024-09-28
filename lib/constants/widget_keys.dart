import 'package:flutter/material.dart';

class WidgetKeys {
  WidgetKeys._();

  // Home keys
  static const ValueKey keyHomeScreen = ValueKey("home_screen_key");
  static const ValueKey keyNewWorkoutCard = ValueKey("new_workout_card_key");
  static const ValueKey keyCustomAppBar = ValueKey("custom_app_bar_key");

  // New Workout keys
  static const ValueKey keyNewWorkoutScreen =
      ValueKey("new_workout_screen_key");
  static const ValueKey keyNewWeightInput = ValueKey("new_weight_input_key");
  static const ValueKey keyNewRepsInput = ValueKey("new_reps_input_key");
  static const ValueKey keyNewSaveButton = ValueKey("new_save_button_key");
  static const ValueKey keyNewSaveWorkoutFAB = ValueKey("new_save_fab_key");
}
