import 'package:flutter/material.dart';
import 'package:very_clean_app/features/posts/presentation/view/posts_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  Widget build(BuildContext context) {
    return PostsView(userId: userId);
  }
}
