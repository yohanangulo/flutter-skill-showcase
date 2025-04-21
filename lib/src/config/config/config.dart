import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_skill_showcase/src/config/service_locator/service_locator.dart';

enum Flavor { dev, prod }

Config get config => getIt<Config>();

class Config {
  Config({required this.flavor, required this.baseUrl});

  final Flavor flavor;
  final String baseUrl;

  Config._(this.flavor, Map<String, dynamic> flavorConfig)
    : baseUrl = flavorConfig['baseUrl'];

  static Future<void> initialize(Flavor flavor) async {
    final configJsonString = await rootBundle.loadString('config/config.json');
    final json = jsonDecode(configJsonString) as Map<String, dynamic>;
    final flavorConfig = json[flavor.name];

    getIt.registerLazySingleton(() => Config._(flavor, flavorConfig));
  }
}
