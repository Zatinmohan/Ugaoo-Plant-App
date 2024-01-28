import 'package:flutter/material.dart';

abstract class RoutesRepoImpl<T> {
  void initilizeRoutes();
  T get router;
  GlobalKey<NavigatorState> get navigationKey;
}
