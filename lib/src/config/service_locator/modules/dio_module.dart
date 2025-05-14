import 'package:dio/dio.dart';
import 'package:flutter_skill_showcase/src/core/auth/src/infrastructure/dio_interceptors/auth_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    dio.options.contentType = Headers.jsonContentType;

    dio.interceptors.addAll([
      AuthInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    ]);
    return dio;
  }
}
