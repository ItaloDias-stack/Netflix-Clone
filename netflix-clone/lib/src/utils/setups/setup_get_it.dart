import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_pagination_example_repository.dart';
import 'package:netfix_clone/src/domain/usecases/get_paginated_example_uc.dart';
import 'package:netfix_clone/src/external/datasources/pagination_example_datasource.dart';
import 'package:netfix_clone/src/presentation/stores/custom_loader_store.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_paginated_example_uc.dart';

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
  //Datasources
  GetIt.I.registerSingleton<IExampleRepository>(
    ExampleDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IPaginationExampleRepository>(
    PaginationExampleDatasource(DioConfig().dio),
  );

  //Usecases
  GetIt.I.registerSingleton<IGetExampleUseCase>(GetExampleUseCase());
  GetIt.I.registerSingleton<IGetPaginationExampleUC>(GetPaginationExampleUC());
}
