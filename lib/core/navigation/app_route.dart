import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  // Common

  home('/home', 'home'),
  profile('/profile', 'profile'),
  wallet('/wallet', 'wallet'),
  newTransaction('/newTransaction', 'newTransaction'),
  auth('/', 'auth'),
  ;

  const AppRoute(
    this.path,
    this.name,
  );

  factory AppRoute.fromPath(String path) {
    return AppRoute.values.firstWhere(
      (route) => route.path == path,
    );
  }

  final String path;
  final String name;
}

extension AppRouteNavigation on AppRoute {
  void go(
    BuildContext context, {
    Map<String, dynamic> params = const {},
  }) =>
      context.goNamed(
        name,
        queryParameters: {
          ...params,
        },
      );

  void push(
    BuildContext context, {
    Map<String, dynamic> params = const {},
  }) =>
      context.pushNamed(
        name,
        queryParameters: {
          ...params,
        },
      );
}
