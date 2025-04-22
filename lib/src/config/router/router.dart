import 'package:flutter_skill_showcase/src/core/post/domain.dart';
import 'package:flutter_skill_showcase/src/presentation/common/widgets/main_navigation_shell.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/auth/signin/signin_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/post_detail_screen/posts_detail_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/posts_list_screen/posts_list_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: SplashScreen.routeName,
      path: SplashScreen.routePath,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: SigninScreen.routeName,
      path: SigninScreen.routePath,
      builder: (context, state) => const SigninScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: PostsListScreen.routeName,
              path: PostsListScreen.routePath,
              builder: (context, state) => const PostsListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: ProfileScreen.routeName,
              path: ProfileScreen.routePath,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: PostsDetailScreen.routeName,
      path: PostsDetailScreen.routePath,
      builder: (context, state) => PostsDetailScreen(post: state.extra as Post),
    ),
  ],
);
