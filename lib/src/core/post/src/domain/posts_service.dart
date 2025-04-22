import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/dto/post_dto.dart';

abstract class PostsService {
  Future<List<PostDTO>> getPosts();
}
