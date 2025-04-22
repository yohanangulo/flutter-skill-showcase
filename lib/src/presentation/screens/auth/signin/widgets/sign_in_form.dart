import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skill_showcase/src/config/extensions/extensions.dart';
import 'package:flutter_skill_showcase/src/presentation/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/auth/signin/cubit/sign_in_cubit.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailOrUsernameController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    _formKey.currentState!.save();
    FocusScope.of(context).unfocus();

    context.read<SignInCubit>().signInWithEmailAndPassword(
      _emailOrUsernameController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  Widget get _buildLogo {
    return Container(
      margin: const EdgeInsets.only(top: 80, bottom: 80, left: 20, right: 20),
      width: 200,
      child: FlutterLogo(size: 100),
    );
  }

  Widget get _buildLoginButton {
    return ElevatedButton(onPressed: _submit, child: const Text('Sign in'));
  }

  TextFormField get _buildPasswordInput {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.trim().length < 6) {
          return "The password must be at least 6 characters long";
        }

        return null;
      },
    );
  }

  TextFormField get _buildEmailInput {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter an email or username";
        }

        return null;
      },
      controller: _emailOrUsernameController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        state.signInFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (failure) {
              context.showSnackBar('Check your credentials');
            },
            (_) {
              context.read<AuthBloc>().add(AuthSignedIn());
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              _buildLogo,
              const SizedBox(height: 20),
              _buildEmailInput,
              const SizedBox(height: 12),
              _buildPasswordInput,
              const SizedBox(height: 40),
              if (state.isLoading)
                const CircularProgressIndicator.adaptive()
              else
                _buildLoginButton,
            ],
          ),
        );
      },
    );
  }
}
