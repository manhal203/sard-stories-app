import 'package:get_it/get_it.dart';
import 'package:sard/core/data/author_data_repo.dart';
import 'package:sard/core/data/story_data_repo.dart';
import 'package:sard/features/auth/repository/auth_repository.dart';

final getIt = GetIt.instance;

abstract class Configuration {
  static void configureDependencies() {
    getIt.registerSingleton<AuthorDataRepo>(AuthorDataRepo());
    getIt.registerSingleton<StoryDataRepo>(StoryDataRepo());
    getIt.registerSingleton<AuthRepository>(AuthRepository());
  }


}
