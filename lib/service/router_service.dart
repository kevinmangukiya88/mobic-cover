import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobic_cover/constant/app_router.dart';
import 'package:mobic_cover/view/404_no_found.dart';
import 'package:mobic_cover/view/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: AppRout.homeScreen,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) {
    return NoRouterScreen();
  },
  debugLogDiagnostics: true,
  redirect: (context, state) {
    return null;
  },
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRout.homeScreen,
      name: AppRout.homeScreen,
      pageBuilder: (context, state) => NoTransitionPage(
        child: MyHomePage(),
      ),
    ),
  ],
);
