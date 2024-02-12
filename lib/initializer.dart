import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:very_clean_app/features/posts/data/data_source/post_remote_data_source.dart';
import 'package:very_clean_app/features/posts/data/repository/post_repository_impl.dart';
import 'package:very_clean_app/features/posts/domain/repository/post_repository.dart';
import 'package:very_clean_app/features/posts/presentation/bloc/posts_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => Client());

  getIt.registerFactory<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(getIt()),
  );

  getIt.registerFactory<PostRepository>(
    () => PostRepositoryImpl(getIt()),
  );

  getIt.registerFactory(() => PostsBloc(getIt()));
}
