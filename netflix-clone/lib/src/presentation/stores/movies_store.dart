import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:netfix_clone/src/external/models/movie.dart';
import 'package:netfix_clone/src/presentation/usecases/i_create_movie_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_delete_movie_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_movies_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_update_movie_uc.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen.dart';
part 'movies_store.g.dart';

class MovieStore = _MovieStoreBase with _$MovieStore;

abstract class _MovieStoreBase with Store {
  @observable
  Movie selectedMovie = const Movie();

  @observable
  ObservableList<Movie> movies = ObservableList.of([]);

  @observable
  bool loading = false;

  @observable
  bool isEditing = false;

  @observable
  Map<String, dynamic> movieRegisterData = {};

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

  @action
  Future deleteMovie({required BuildContext context}) async {
    loading = true;
    await GetIt.I.get<IDeleteMovieUseCase>()(
        id: selectedMovie.id, context: context);
    await getAllMovies(context: context);
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => route.isFirst);
    loading = false;
  }

  @action
  Future createOrUpdateAMovie({required BuildContext context}) async {
    loading = true;
    bool response = false;
    if (!isEditing) {
      response = await GetIt.I.get<ICreateMovieUseCase>()(
        context: context,
        body: movieRegisterData,
      );
    } else {
      response = await GetIt.I.get<IUpdateMovieUseCase>()(
        context: context,
        id: selectedMovie.id,
        body: movieRegisterData,
      );
    }
    if (response) {
      await getAllMovies(context: context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (route) => route.isFirst,
      );
    }
    loading = false;
  }
}
