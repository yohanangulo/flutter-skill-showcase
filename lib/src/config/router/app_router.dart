import 'package:flutter/material.dart';

abstract class AppRouter {
  RouterDelegate<Object> get routerDelegate;

  Future<T?> navigateTo<T>(String routeName, {Object? arguments});

  /// Replace all routes with a new one
  void replaceAll(String routeName, {Object? arguments});

  void pop<T>([T? result]);
}
