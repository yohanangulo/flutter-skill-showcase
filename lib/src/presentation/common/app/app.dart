import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Showcase',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
