import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/pages/address_page/views/pages/address_page.dart';
import 'package:ugaoo/pages/bottom_navigation_page/views/bottom_nav_page_main.dart';
import 'package:ugaoo/pages/login_page/login_page.dart';
import 'package:ugaoo/pages/registration_page/views/registration_page.dart';
import 'package:ugaoo/pages/splash_page/views/main_page.dart';
import 'package:ugaoo/routes/repositories/routes_repo_impl.dart';
import 'package:ugaoo/routes/constants/routes_name.dart';
import 'package:ugaoo/services/auth/repositories/auth_types_services.dart';

const String _logName = "Go Router";

class GoRouterService implements RoutesRepoImpl<GoRouter> {
  late final GoRouter _router;
  late final GlobalKey<NavigatorState> _navigatorKey;
  late final LoginServiceRepo _loginServiceRepo;

  GoRouterService({
    required GlobalKey<NavigatorState> navigationKey,
    required LoginServiceRepo loginService,
  })  : _navigatorKey = navigationKey,
        _loginServiceRepo = loginService {
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
          redirect: (context, state) async {
            if (await _loginServiceRepo.isUserLoggedIn()) {
              return "${RoutesName.ROOT}${RoutesName.HOME_PAGE}";
            } else {
              return null;
            }
          },
          name: RoutesName.ROOT,
          path: RoutesName.ROOT,
          builder: (context, state) {
            return const SplashPage();
          },
          routes: [
            GoRoute(
              name: RoutesName.LOGIN_SCREEN,
              path: "${RoutesName.LOGIN_SCREEN}",
              builder: (context, state) {
                return const LoginPage();
              },
              routes: [
                GoRoute(
                  name: RoutesName.REGISTER_SCREEN,
                  path: "${RoutesName.REGISTER_SCREEN}",
                  builder: (context, state) {
                    return const RegistrationPage();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          name: RoutesName.HOME_PAGE,
          path: "${RoutesName.ROOT}${RoutesName.HOME_PAGE}",
          builder: (context, state) {
            return BottomNavigationPage();
          },
          routes: [
            GoRoute(
              name: RoutesName.ADDRESS_PAGE,
              path: "${RoutesName.ADDRESS_PAGE}",
              builder: (context, state) {
                return AddressPage();
              },
            ),
          ],
        ),
      ],
    );
  }
}
