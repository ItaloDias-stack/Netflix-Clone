import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:netfix_clone/src/external/models/movie.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_movies_uc.dart';
part 'movies_store.g.dart';

class MovieStore = _MovieStoreBase with _$MovieStore;

abstract class _MovieStoreBase with Store {
  @observable
  Movie selectedMovie = const Movie();

  @observable
  ObservableList<Movie> movies = ObservableList.of([]);

  @observable
  bool loading = false;

  @action
  setSelectedMovie(Movie value) => selectedMovie = value;

  @action
  Future getAllMovies({required BuildContext context}) async {
    loading = true;
    movies = ObservableList.of(
      await GetIt.I.get<IGetMoviesUseCase>()(context: context),
    );
    loading = false;
  }
}
