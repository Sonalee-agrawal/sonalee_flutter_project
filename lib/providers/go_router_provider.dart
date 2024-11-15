import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sonalee_app/ui/add_habit.dart';
import 'package:sonalee_app/ui/splash_screen.dart';
import '../ui/dashboard.dart';
import '../ui/error_screen.dart';
import '../ui/method_channel_screen.dart';
import '../utils/helpers/route_name.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteName.splash.path(),
    routes: [
      GoRoute(
          path: RouteName.splash.path(),
          name: RouteName.splash,
          builder: (context, state) {
            return const SplashScreen();
          }),
      GoRoute(
          path: RouteName.dashboard.path(),
          name: RouteName.dashboard,
          builder: (context, state) {
            return const DashboardScreen();
          }),
      GoRoute(
          path: RouteName.methodChannelScreen.path(),
          name: RouteName.methodChannelScreen,
          builder: (context, state) {
            return const MethodChannelScreen();
          }),
      GoRoute(
          path: RouteName.addHabit.path(),
          name: RouteName.addHabit,
          builder: (context, state) {
            return const AddHabitScreen();
          }),
    ],
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
  );
});
