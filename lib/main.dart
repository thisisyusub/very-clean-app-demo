import 'package:flutter/material.dart';
import 'package:very_clean_app/initializer.dart';
import 'package:very_clean_app/pages/posts/posts_page.dart';
import 'package:very_clean_app/pages/users/users_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UsersPage(),
      routes: {
        '/posts': (context) {
          final modalRoute = ModalRoute.of(context);
          final userId = modalRoute!.settings.arguments as int;

          return PostsPage(userId: userId);
        }
      },
    );
  }
}
