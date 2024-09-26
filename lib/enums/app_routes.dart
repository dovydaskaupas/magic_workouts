enum AppRoutes {
  home(path: "/"),
  newWorkout(path: "/new-workout"),
  workoutList(path: "/workout-list");

  const AppRoutes({required this.path});
  final String path;
}
