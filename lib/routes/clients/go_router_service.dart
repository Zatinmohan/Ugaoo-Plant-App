import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/pages/home_page/views/home_page_main.dart';
import 'package:ugaoo/pages/login_page/login_page.dart';
import 'package:ugaoo/pages/registration_page/views/registration_page.dart';
import 'package:ugaoo/pages/splash_page/views/main_page.dart';
import 'package:ugaoo/routes/repositories/routes_repo_impl.dart';
import 'package:ugaoo/routes/constants/routes_name.dart';

const String _logName = "Go Router";

class GoRouterService implements RoutesRepoImpl<GoRouter> {
  late final GoRouter _router;
  late final GlobalKey<NavigatorState> _navigatorKey;

  GoRouterService({
    required GlobalKey<NavigatorState> navigationKey,
  }) : _navigatorKey = navigationKey {
    log("Go Router Service Started", name: _logName);
  }

  @override
  GoRouter get router => _router;

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigatorKey;

  @override
  void initilizeRoutes() {
    _router = GoRouter(
      navigatorKey: _navigatorKey,
      initialLocation: RoutesName.ROOT,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesName.ROOT,
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: RoutesName.LOGIN_SCREEN,
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: RoutesName.REGISTER_SCREEN,
          builder: (context, state) {
            return const RegistrationPage();
          },
        ),
        GoRoute(
          path: RoutesName.HOME_PAGE,
          builder: (context, state) {
            return const HomePageMain();
          },
        ),
      ],
    );
  }
}
