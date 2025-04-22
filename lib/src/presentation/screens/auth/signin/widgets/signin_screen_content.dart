import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/extensions/extensions.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/auth/signin/widgets/sign_in_form.dart';

class SignInScreenContent extends StatefulWidget {
  const SignInScreenContent({super.key});

  @override
  State<SignInScreenContent> createState() => _SignInScreenContentState();
}

class _SignInScreenContentState extends State<SignInScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: const SignInForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
