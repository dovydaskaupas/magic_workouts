import 'package:flutter/material.dart';
import 'package:magic_workouts/constants/app_strings.dart';
import 'package:magic_workouts/utilities/app_router.dart';
import 'package:magic_workouts/utilities/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.instance.router,
      title: AppStrings.appName,
      theme: AppTheme.instance.theme,
    );
  }
}
