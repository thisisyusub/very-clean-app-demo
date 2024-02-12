import 'package:very_clean_app/features/users/domain/entity/user_entity.dart';

class UserListDto {
  const UserListDto({required this.users});

  final List<UserDto> users;

  factory UserListDto.fromJson(List<dynamic> json) {
    return UserListDto(
      users: json.map((userJson) => UserDto.fromJson(userJson)).toList(),
    );
  }

  UserListEntity toEntity() {
    return UserListEntity(
      users: users.map((user) => user.toEntity()).toList(),
    );
  }
}

class UserDto {
  const UserDto({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  final int id;
  final String name;
  final String username;
  final String email;

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: name,
      email: email,
    );
  }
}
