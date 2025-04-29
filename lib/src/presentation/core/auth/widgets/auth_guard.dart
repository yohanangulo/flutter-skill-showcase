import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skill_showcase/src/config/router/app_navigator.dart';
import 'package:flutter_skill_showcase/src/presentation/core/auth/bloc/auth_bloc.dart';
import 'package:nested/nested.dart';

class AuthGuard extends SingleChildStatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state) {
          case Authenticated():
            AppNavigator.replaceToPosts();
          default:
            AppNavigator.replaceToSignin();
        }
      },
      child: child,
    );
  }
}
