import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skill_showcase/src/config/router/app_navigator.dart';
import 'package:flutter_skill_showcase/src/core/post/domain.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/posts_list_screen/bloc/posts_list_bloc.dart';

class PostsListBody extends StatelessWidget {
  const PostsListBody({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;
    final bloc = context.read<PostsListBloc>();

    if (posts.isEmpty) {
      return RefreshIndicator.adaptive(
        edgeOffset: safePadding,
        onRefresh: () async {
          bloc.add(PostsListRefreshed());

          final state = bloc.stream.firstWhere((state) => !state.isRefreshing);

          await state;
        },
        child: const Center(child: Text('No posts')),
      );
    }

    return RefreshIndicator.adaptive(
      edgeOffset: safePadding,
      onRefresh: () async {
        bloc.add(PostsListRefreshed());

        final state = bloc.stream.firstWhere((state) => !state.isRefreshing);

        await state;
      },
      child: ListView.separated(
        padding: EdgeInsets.only(top: safePadding + 20),
        itemCount: posts.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              AppNavigator.navigateToPostDetails(
                posts[index].id.toString(),
                posts[index],
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  posts[index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(posts[index].body),
              ),
            ),
          );
        },
      ),
    );
  }
}
