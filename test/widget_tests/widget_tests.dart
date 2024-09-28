import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/constants/widget_keys.dart';
import 'package:magic_workouts/screens/new_workout/new_workout_screen.dart';
import 'package:magic_workouts/utilities/app_router.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  group("UI rendering tests.", () {
    testWidgets(
      "HomeScreen and CustomAppBar widgets should be shown.",
      (final WidgetTester tester) async {
        await mockNetworkImages(
          () async => tester.pumpWidget(
            MaterialApp.router(routerConfig: AppRouter.instance.router),
          ),
        );

        expect(find.byKey(WidgetKeys.keyHomeScreen), findsOneWidget);
        expect(find.byKey(WidgetKeys.keyCustomAppBar), findsOneWidget);
      },
    );
  });

  group("Widget interaction tests.", () {
    testWidgets(
      "NewWorkoutScreen should be displayed after taping on NewWorkoutCard.",
      (WidgetTester tester) async {
        await mockNetworkImages(
          () async => tester.pumpWidget(
            ProviderScope(
              child: MaterialApp.router(
                routerConfig: AppRouter.instance.router,
              ),
            ),
          ),
        );

        final homeScreen = find.byKey(WidgetKeys.keyHomeScreen);
        final newWorkoutCard = find.byKey(WidgetKeys.keyNewWorkoutCard);
        final newWorkoutScreen = find.byKey(WidgetKeys.keyNewWorkoutScreen);

        // Verify that HomeScreen and its components are displayed.
        expect(homeScreen, findsOneWidget);
        expect(newWorkoutCard, findsOneWidget);

        // Verify that NewWorkoutScreen is not yet shown.
        expect(newWorkoutScreen, findsNothing);

        // Tap the NewWorkoutCard to navigate to NewWorkoutScreen.
        await tester.tap(newWorkoutCard);
        await tester.pumpAndSettle();

        // Verify that NewWorkoutScreen is displayed.
        expect(newWorkoutScreen, findsOneWidget);

        // Verify that HomeScreen is not shown anymore.
        expect(newWorkoutCard, findsNothing);
      },
    );
  });

  group("State management tests.", () {
    testWidgets(
      "SaveWorkoutFloatingActionButton should be displayed"
      "when the NewWorkout details are saved.",
      (WidgetTester tester) async {
        await mockNetworkImages(
          () async => tester.pumpWidget(
            const ProviderScope(child: MaterialApp(home: NewWorkoutScreen())),
          ),
        );

        final saveWorkoutFAB = find.byKey(WidgetKeys.keyNewSaveWorkoutFAB);

        // Verify that the SaveWorkout FloatingActionButton is not shown yet.
        expect(saveWorkoutFAB, findsNothing);

        // Verify that the ExerciseDropdownButton is not set.
        expect(find.text(AppStrings.newExerciseDropdownHint), findsOneWidget);
        expect(find.text(AppStrings.newExercise1), findsNothing);

        // Tap to open the ExerciseDropdownButton widget.
        await tester.tap(find.byType(DropdownButton<String>));
        await tester.pumpAndSettle();

        // Select the Barbell Row exercise.
        await tester.tap(find.text(AppStrings.newExercise1).last);
        await tester.pumpAndSettle();

        // Populate input fields with values.
        await tester.enterText(find.byKey(WidgetKeys.keyNewWeightInput), "70");
        await tester.enterText(find.byKey(WidgetKeys.keyNewRepsInput), "10");
        await tester.pump();

        // Press the Save button.
        await tester.tap(find.byKey(WidgetKeys.keyNewSaveButton));
        await tester.pumpAndSettle();

        // The WorkoutSetCountNotifier provider should be notified,
        // and the SaveWorkout FloatingActionButton should be shown.
        expect(saveWorkoutFAB, findsOneWidget);
      },
    );
  });
}
