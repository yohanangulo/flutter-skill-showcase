import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skill_showcase/src/config/router/router.dart';
import 'package:flutter_skill_showcase/src/presentation/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/auth/signin/signin_screen.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/posts_list_screen/posts_list_screen.dart';
import 'package:nested/nested.dart';

class AuthGuard extends SingleChildStatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state) {
          case Authenticated():
            router.goNamed(PostsListScreen.routeName);
          default:
            router.goNamed(SigninScreen.routeName);
        }
      },
      child: child,
    );
  }
}
