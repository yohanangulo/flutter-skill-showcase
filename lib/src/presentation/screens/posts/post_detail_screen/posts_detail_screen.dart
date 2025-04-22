import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/core/post/domain.dart';

class PostsDetailScreen extends StatelessWidget {
  const PostsDetailScreen({super.key, required this.post});

  final Post post;

  static const routeName = 'posts_detail_screen';
  static const routePath = '/posts_detail_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement delete post
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(11),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
