import 'package:very_clean_app/features/posts/domain/entity/post_entity.dart';

class PostListDto {
  const PostListDto({required this.users});

  final List<PostDto> users;

  factory PostListDto.fromJson(List<dynamic> json) {
    return PostListDto(
      users: json.map((postJson) => PostDto.fromJson(postJson)).toList(),
    );
  }

  PostListEntity toEntity() {
    return PostListEntity(
      posts: users.map((user) => user.toEntity()).toList(),
    );
  }
}

class PostDto {
  const PostDto({
    required this.id,
    required this.title,
    required this.body,
  });

  final int id;
  final String title;
  final String body;

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      title: title,
      body: body,
    );
  }
}
