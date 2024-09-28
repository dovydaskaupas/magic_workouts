import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/widget_keys.dart';
import 'package:magic_workouts/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("tap on the floating action button, verify counter",
        (tester) async {
      // Load the app.
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      // Verify that we are in HomeScreen.
      expect(find.byKey(WidgetKeys.keyHomeScreen), findsOneWidget);

      // Find WorkoutCard and tap on it to navigate to NewWorkoutScreen.
      await tester.tap(find.byKey(WidgetKeys.keyNewWorkoutCard));
      await tester.pumpAndSettle();

      // Verify that we are in NewWorkoutScreen
      expect(find.byKey(WidgetKeys.keyNewWorkoutScreen), findsOneWidget);

      // Tap to open the ExerciseDropdownButton widget.
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      // Select the Barbell Row exercise from the Dropdown list.
      await tester.tap(find.text(AppStrings.newExercise2).last);
      await tester.pumpAndSettle();

      // Populate input fields with values.
      await tester.enterText(find.byKey(WidgetKeys.keyNewWeightInput), "80");
      await tester.enterText(find.byKey(WidgetKeys.keyNewRepsInput), "10");
      await tester.pump();

      // Press the Save button to add a new set.
      await tester.tap(find.byKey(WidgetKeys.keyNewSaveButton));
      await tester.pumpAndSettle();

      // Press the Save Workout FloatingActionButton to save the workout.
      await tester.tap(find.byKey(WidgetKeys.keyNewSaveWorkoutFAB));
      await tester.pumpAndSettle();

      // Wait for the AlertDialog to appear.
      final alertDialogFinder = find.byKey(WidgetKeys.keyInputDialog);

      // Verify that we see the AlertDialog.
      expect(alertDialogFinder, findsOneWidget);

      // Enter the workout name into the dialog's input field.
      await tester.enterText(alertDialogFinder, "Bench press workout");
      await tester.pump();

      // Tap the 'Confirm' button to save the workout and close the dialog.
      final confirmButton = find.text(AppStrings.genConfirm);
      await tester.tap(confirmButton);
      await tester.pumpAndSettle();

      // Navigate back to HomeScreen.
      await tester.tap(find.byTooltip("Back"));
      await tester.pumpAndSettle();

      // Find WorkoutList card and tap on it to navigate to WorkoutListScreen.
      await tester.tap(find.byKey(WidgetKeys.keyWorkoutListCard));
      await tester.pumpAndSettle();

      // Verify that the saved 'Bench press workout'
      // is available in the WorkoutsListScreen.
      expect(find.text("Bench press workout"), findsOneWidget);
    });
  });
}
