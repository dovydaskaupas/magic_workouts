import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_workouts/constants/app_strings.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});

  final GoException? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error?.message ?? AppStrings.errorGeneric),
    );
  }
}
