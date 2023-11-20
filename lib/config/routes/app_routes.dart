import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp_riverpod/config/routes/routes.dart';
import 'package:todoapp_riverpod/screens/screens.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigatorKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigatorKey,
    builder: CreateTaskScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.settings,
    parentNavigatorKey: navigatorKey,
    builder: SettingsScreeen.builder,
  ),
];
