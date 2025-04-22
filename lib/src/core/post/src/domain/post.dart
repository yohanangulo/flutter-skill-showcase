import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  factory Post({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _Post;
}
