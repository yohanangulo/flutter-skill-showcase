import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/config/config.dart';
import 'package:flutter_skill_showcase/src/config/service_locator/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Center(
          child: Column(
            children: [
              Text('Hello World'),
              ElevatedButton(
                onPressed: () {
                  final a = getit<Config>().baseUrl;
                  print('baseUrl: $a');
                },
                child: Text('test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
