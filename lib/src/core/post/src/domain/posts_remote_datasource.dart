import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/remote/dto/post_dto.dart';

abstract class PostsRemoteDatasource {
  Future<List<PostDTO>> getPosts();
}
