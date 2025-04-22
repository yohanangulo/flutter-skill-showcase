import 'package:dio/dio.dart';
import 'package:flutter_skill_showcase/src/core/auth/src/infrastructure/dio_interceptors/auth_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    dio.options.contentType = Headers.jsonContentType;

    dio.interceptors.addAll([AuthInterceptor()]);

    return dio;
  }
}
