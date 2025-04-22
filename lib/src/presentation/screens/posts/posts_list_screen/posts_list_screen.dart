import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skill_showcase/src/config/service_locator/service_locator.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/posts_list_screen/bloc/posts_list_bloc.dart';
import 'package:flutter_skill_showcase/src/presentation/screens/posts/posts_list_screen/widgets/posts_list_body.dart';

class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key});

  static const routeName = 'posts_list';
  static const routePath = '/posts';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PostsListBloc>()..add(PostsListRequested()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<PostsListBloc>();
          return Scaffold(
            body: BlocBuilder<PostsListBloc, PostsListState>(
              builder: (context, state) {
                switch (state.status) {
                  case PostsListStatus.initial:
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  case PostsListStatus.failure:
                    return ListView(
                      children: [
                        const SizedBox(height: 100),
                        const Center(child: Text('An error occurred')),
                        IconButton(
                          onPressed: () {
                            bloc.add(PostsListRequested());
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    );
                  case PostsListStatus.success:
                    return PostsListBody(posts: state.posts);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
