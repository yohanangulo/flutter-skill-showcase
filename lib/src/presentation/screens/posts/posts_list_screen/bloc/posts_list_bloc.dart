import 'package:bloc/bloc.dart';
import 'package:flutter_skill_showcase/src/core/post/domain.dart';
import 'package:flutter_skill_showcase/src/core/post/src/application/get_posts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'posts_list_event.dart';
part 'posts_list_state.dart';
part 'posts_list_bloc.freezed.dart';

@injectable
class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc(this._getPosts) : super(PostsListState.initial()) {
    on<PostsListRequested>(_onPostsRequested);
    on<PostsListRefreshed>(_onPostsRefreshed);
  }

  final GetPosts _getPosts;

  void _onPostsRequested(
    PostsListRequested event,
    Emitter<PostsListState> emit,
  ) async {
    emit(state.copyWith(status: PostsListStatus.initial, failure: null));

    final result = await _getPosts();

    result.fold(
      (failure) {
        emit(state.copyWith(status: PostsListStatus.failure, failure: failure));
      },
      (posts) {
        emit(state.copyWith(status: PostsListStatus.success, posts: posts));
      },
    );
  }

  void _onPostsRefreshed(
    PostsListRefreshed event,
    Emitter<PostsListState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));

    final result = await _getPosts();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostsListStatus.failure,
            failure: failure,
            isRefreshing: false,
          ),
        );
      },
      (posts) {
        emit(
          state.copyWith(
            status: PostsListStatus.success,
            posts: posts,
            isRefreshing: false,
          ),
        );
      },
    );
  }
}
