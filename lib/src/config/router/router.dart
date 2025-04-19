import 'package:flutter_skill_showcase/src/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: SplashScreen.routeName,
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
