import 'package:dio/dio.dart';
import 'package:flutter_skill_showcase/src/config/config/config.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_remote_datasource.dart';
import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/remote/dto/post_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_remote_datasource_impl.g.dart';

@Injectable(as: PostsRemoteDatasource)
@RestApi()
abstract class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  @factoryMethod
  factory PostsRemoteDatasourceImpl(Dio dio) {
    return _PostsRemoteDatasourceImpl(dio, baseUrl: config.baseUrl);
  }

  @GET('/posts')
  @override
  Future<List<PostDTO>> getPosts();
}
