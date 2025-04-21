import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/config/config.dart';
import 'package:flutter_skill_showcase/src/config/service_locator/service_locator.dart';
import 'package:flutter_skill_showcase/src/presentation/common/app/app.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.initialize(flavor);
  await configureDependencies();
  runApp(const App());
}
