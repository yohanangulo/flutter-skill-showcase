import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skill_showcase/src/config/service_locator/service_locator.dart';
import 'package:flutter_skill_showcase/src/presentation/core/auth/bloc/auth_bloc.dart';

class GlobalBlocs extends StatelessWidget {
  const GlobalBlocs({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => getIt<AuthBloc>()..add(AuthStarted()),
        ),
      ],
      child: child,
    );
  }
}
