import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skill_showcase/src/config/service_locator/service_locator.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/auth/signin/cubit/sign_in_cubit.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/auth/signin/widgets/signin_screen_content.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: const SignInScreenContent(),
    );
  }
}
