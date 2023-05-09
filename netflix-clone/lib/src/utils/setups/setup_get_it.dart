import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_movie_repository.dart';
import 'package:netfix_clone/src/domain/repositories/i_pagination_example_repository.dart';
import 'package:netfix_clone/src/domain/repositories/i_user_repository.dart';
import 'package:netfix_clone/src/domain/usecases/create_movie_uc.dart';
import 'package:netfix_clone/src/domain/usecases/create_user_uc.dart';
import 'package:netfix_clone/src/domain/usecases/delete_movie_uc.dart';
import 'package:netfix_clone/src/domain/usecases/get_movies.dart';
import 'package:netfix_clone/src/domain/usecases/get_paginated_example_uc.dart';
import 'package:netfix_clone/src/domain/usecases/get_user_by_id_uc.dart';
import 'package:netfix_clone/src/domain/usecases/login_uc.dart';
import 'package:netfix_clone/src/domain/usecases/update_movie_uc.dart';
import 'package:netfix_clone/src/external/datasources/movies_datasource.dart';
import 'package:netfix_clone/src/external/datasources/pagination_example_datasource.dart';
import 'package:netfix_clone/src/external/datasources/user_datasource.dart';
import 'package:netfix_clone/src/presentation/stores/custom_loader_store.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/stores/user_store.dart';
import 'package:netfix_clone/src/presentation/usecases/i_create_movie_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_create_user_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_delete_movie_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_movies_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_paginated_example_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_user_by_id_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_login_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_update_movie_uc.dart';
import 'package:netfix_clone/src/utils/setups/setup_flavors.dart';

import '../../domain/repositories/i_example_repository.dart';
import '../../domain/usecases/get_example_uc.dart';
import '../../external/datasources/example_datasource.dart';
import '../../presentation/stores/example_store.dart';
import '../../presentation/usecases/i_get_example_uc.dart';
import '../dio_config.dart';

void setupGetIt() {
  //Stores
  GetIt.I.registerSingleton<ExampleStore>(ExampleStore());
  GetIt.I.registerSingleton<CustomLoaderStore>(CustomLoaderStore());
  GetIt.I.registerSingleton<MovieStore>(MovieStore());
  GetIt.I.registerSingleton<UserStore>(UserStore());
  //Datasources
  GetIt.I.registerSingleton<IExampleRepository>(
    ExampleDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IPaginationExampleRepository>(
    PaginationExampleDatasource(DioConfig().dio),
  );

  GetIt.I.registerSingleton<IUserRepository>(
    UserDatasource(DioConfig().dio, baseUrl: SetupFlavors().baseUrl),
  );

  GetIt.I.registerSingleton<IMovieRepository>(
    MovieDatasource(DioConfig().dio, baseUrl: SetupFlavors().baseUrl),
  );

  //Usecases
  GetIt.I.registerSingleton<IGetExampleUseCase>(GetExampleUseCase());
  GetIt.I.registerSingleton<IGetPaginationExampleUC>(GetPaginationExampleUC());
  GetIt.I.registerSingleton<ILoginUseCase>(LoginUseCase());
  GetIt.I.registerSingleton<ICreateUserUseCase>(CreateUserUseCase());
  GetIt.I.registerSingleton<IGetMoviesUseCase>(GetMoviesUseCase());
  GetIt.I.registerSingleton<IGetUserByIdUseCase>(GetUserByIdUseCase());
  GetIt.I.registerSingleton<ICreateMovieUseCase>(CreateMovieUseCase());
  GetIt.I.registerSingleton<IUpdateMovieUseCase>(UpdateMovieUseCase());
  GetIt.I.registerSingleton<IDeleteMovieUseCase>(DeleteMovieUseCase());
}
