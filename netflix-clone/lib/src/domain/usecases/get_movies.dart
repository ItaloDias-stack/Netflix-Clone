import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_movie_repository.dart';
import 'package:netfix_clone/src/external/models/movie.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_movies_uc.dart';
import 'package:netfix_clone/src/utils/misc.dart';

class GetMoviesUseCase implements IGetMoviesUseCase {
  @override
  Future<List<Movie>> call({required BuildContext context}) async {
    try {
      List<Movie> movies = [];
      var response = await GetIt.I.get<IMovieRepository>().getMovies();
      if (response["data"] != null) {
        for (var movie in response["data"]) {
          movies.add(Movie.fromJson(movie));
        }
      }
      return movies;
    } catch (e) {
      showMessage("Esso ao buscar os filmes", Colors.red, context);
      return [];
    }
  }
}
