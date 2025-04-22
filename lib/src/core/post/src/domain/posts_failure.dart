import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_failure.freezed.dart';

@freezed
class PostsFailure with _$PostsFailure {
  factory PostsFailure.serverError() = _ServerError;
  factory PostsFailure.networkError() = _NetworkError;
  factory PostsFailure.unauthorized() = _Unauthorized;
  factory PostsFailure.unknown() = _Unknown;
}
