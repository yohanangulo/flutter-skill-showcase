import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/presentation/core/auth/widgets/auth_guard.dart';
import 'package:nested/nested.dart';

class GlobalListeners extends StatelessWidget {
  const GlobalListeners({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Nested(children: [AuthGuard()], child: child);
  }
}
