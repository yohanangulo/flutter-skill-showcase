import 'package:dio/dio.dart';
import 'package:flutter_skill_showcase/src/config/config/config.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_service.dart';
import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/dto/post_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_service_impl.g.dart';

@Injectable(as: PostsService)
@RestApi()
abstract class PostsServiceImpl implements PostsService {
  @factoryMethod
  factory PostsServiceImpl(Dio dio) {
    return _PostsServiceImpl(dio, baseUrl: config.baseUrl);
  }

  @GET('/posts')
  @override
  Future<List<PostDTO>> getPosts();
}
