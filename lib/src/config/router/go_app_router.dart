import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/router/app_router.dart';
import 'package:go_router/go_router.dart';

class GoAppRouter extends AppRouter {
  GoAppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required List<RouteBase> routes,
    required String initialLocation,
  }) : _goRouter = GoRouter(
         navigatorKey: navigatorKey,
         routes: routes,
         initialLocation: initialLocation,
         debugLogDiagnostics: true,
       );

  final GoRouter _goRouter;

  @override
  GoRouterDelegate get routerDelegate => _goRouter.routerDelegate;

  GoRouter get config => _goRouter;

  @override
  Future<T?> navigateTo<T>(
    String routeName, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    return _goRouter.pushNamed<T>(
      routeName,
      extra: arguments,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  @override
  void pop<T>([T? result]) {
    _goRouter.pop<T>(result);
  }

  @override
  void replaceAll(String routeName, {Object? arguments}) {
    _goRouter.goNamed(routeName, extra: arguments);
  }
}
