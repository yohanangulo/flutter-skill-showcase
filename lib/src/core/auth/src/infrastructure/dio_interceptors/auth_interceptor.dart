import 'package:dio/dio.dart';
import 'package:flutter_skill_showcase/src/config/service_locator/service_locator.dart';
import 'package:flutter_skill_showcase/src/core/auth/src/infrastructure/user_data_storage.dart';

class AuthInterceptor extends Interceptor {
  static final UserDataStorage _userDataStorage = getIt<UserDataStorage>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _userDataStorage.getAccessToken();

    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }
}
