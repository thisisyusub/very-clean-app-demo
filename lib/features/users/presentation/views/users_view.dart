import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_clean_app/features/users/domain/entity/user_entity.dart';
import 'package:very_clean_app/features/users/presentation/bloc/users_bloc.dart';

typedef OnUserSelected = void Function(UserEntity user);

class UsersView extends StatelessWidget {
  const UsersView({
    super.key,
    this.onUserSelected,
  });

  final OnUserSelected? onUserSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      create: (_) => UsersBloc()..add(UsersDataRequested()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              return switch (state) {
                UsersInitial() => const SizedBox.shrink(),
                UsersInProgress() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                UsersFailure(:var message) => Text(message),
                UsersSuccess(:var users) => ListView.builder(
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            user.id.toString(),
                          ),
                        ),
                        title: Text(user.fullName),
                        subtitle: Text(user.email),
                        onTap: () {
                          onUserSelected?.call(user);
                        },
                      );
                    },
                    itemCount: users.length,
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
