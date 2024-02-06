import 'package:ugaoo/routes/repositories/routes_repo_impl.dart';

class RoutesProvider<T> {
  final RoutesRepoImpl<T> _routerService;

  RoutesProvider({required RoutesRepoImpl<T> routesService})
      : _routerService = routesService {
    _routerService.initilizeRoutes();
  }

  T get router => _routerService.router;

  RoutesRepoImpl<T> get routerService => _routerService;
}
