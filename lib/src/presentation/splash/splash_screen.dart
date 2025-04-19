import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
