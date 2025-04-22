import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/router/router.dart';
import 'package:flutter_skill_showcase/src/presentation/global/global_blocs.dart';
import 'package:flutter_skill_showcase/src/presentation/global/global_listeners.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocs(
      child: GlobalListeners(
        child: MaterialApp.router(
          title: 'Showcase',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
        ),
      ),
    );
  }
}
