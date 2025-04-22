import 'package:flutter_skill_showcase/src/core/post/src/domain/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_dto.freezed.dart';
part 'post_dto.g.dart';

@freezed
abstract class PostDTO with _$PostDTO {
  factory PostDTO({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostDTO;

  factory PostDTO.fromJson(Map<String, dynamic> json) =>
      _$PostDTOFromJson(json);

  const PostDTO._();

  Post toDomain() => Post(userId: userId, id: id, title: title, body: body);
}
