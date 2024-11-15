class RouteName {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String methodChannelScreen = 'methodChannelScreen';
  static const String habitDashboardScreen = 'habitDashboardScreen';
  static const String dashboard = 'dashboard';
  static const String addHabit = 'addHabit';
}

extension GoRouterPath on String {
  String path() => '/$this';
}
