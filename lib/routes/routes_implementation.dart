import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/pages/home_page/views/home_page_main.dart';
import 'package:ugaoo/pages/login_page/login_page.dart';
import 'package:ugaoo/pages/registration_page/views/registration_page.dart';
import 'package:ugaoo/pages/splash_page/views/main_page.dart';
import 'package:ugaoo/routes/routes_name.dart';

class Routes {
  static late GoRouter _router;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static final Routes instance = Routes._instance();

  Routes._instance() {
    _initilizeRoutes();
  }

  factory Routes() {
    return instance;
  }

  GlobalKey get navigationKey => _navigatorKey;

  GoRouter get router => _router;

  void _initilizeRoutes() {
    _router = GoRouter(
      // redirect: (context, state) async {},
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
