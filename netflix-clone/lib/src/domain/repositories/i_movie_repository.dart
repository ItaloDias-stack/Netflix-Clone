abstract class IMovieRepository {
  Future getMovies();
  Future createMovie({
    required Map<String, dynamic> body,
  });

  Future updateMovie({
    required Map<String, dynamic> body,
    required int id,
  });

  Future deleteMovie({
    required int id,
  });
}
