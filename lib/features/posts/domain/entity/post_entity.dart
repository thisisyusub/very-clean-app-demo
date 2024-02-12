class PostListEntity {
  const PostListEntity({required this.posts});

  final List<PostEntity> posts;
}

class PostEntity {
  const PostEntity({
    required this.id,
    required this.title,
    required this.body,
  });

  final int id;
  final String title;
  final String body;
}
