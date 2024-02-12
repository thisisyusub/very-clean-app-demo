import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:very_clean_app/features/posts/data/data_source/post_remote_data_source.dart';
import 'package:very_clean_app/features/posts/data/repository/post_repository_impl.dart';
import 'package:very_clean_app/features/posts/presentation/bloc/posts_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (_) => GetIt.instance.get<PostsBloc>()
        ..add(
          UserPostsRequested(userId),
        ),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              return switch (state) {
                PostsInitial() => const SizedBox.shrink(),
                PostsInProgress() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                PostsFailure(:var message) => Text(message),
                PostsSuccess(:var posts) => ListView.builder(
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            post.id.toString(),
                          ),
                        ),
                        title: Text(post.title),
                        subtitle: Text(post.body),
                        isThreeLine: true,
                      );
                    },
                    itemCount: posts.length,
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
