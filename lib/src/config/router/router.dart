import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/router/go_app_router.dart';
import 'package:flutter_skill_showcase/src/core/post/domain.dart';
import 'package:flutter_skill_showcase/src/presentation/common/widgets/main_navigation_shell.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/auth/signin/signin_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/post_detail_screen/posts_detail_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/posts_list_screen/posts_list_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoAppRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.splash.path,
  routes: [
    GoRoute(
      name: Routes.splash.name,
      path: Routes.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: Routes.signin.name,
      path: Routes.signin.path,
      builder: (context, state) => const SigninScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: shellNavigatorKey,
          routes: [
            GoRoute(
              name: Routes.postsList.name,
              path: Routes.postsList.path,
              builder: (context, state) => const PostsListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.profile.name,
              path: Routes.profile.path,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: Routes.postDetails.name,
      path: Routes.postDetails.path,
      builder: (context, state) => PostsDetailScreen(post: state.extra as Post),
    ),
  ],
);
