import 'package:flutter/material.dart';
import 'package:very_clean_app/features/users/presentation/views/users_view.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UsersView(
      onUserSelected: (user) {
        Navigator.of(context).pushNamed(
          '/posts',
          arguments: user.id,
        );
      },
    );
  }
}
