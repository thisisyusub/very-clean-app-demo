class UserListEntity {
  const UserListEntity({required this.users});

  final List<UserEntity> users;
}

class UserEntity {
  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
  });

  final int id;
  final String fullName;
  final String email;
}
