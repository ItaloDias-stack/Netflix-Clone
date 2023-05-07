import 'package:dio/dio.dart';
import 'package:netfix_clone/src/domain/repositories/i_movie_repository.dart';
import 'package:retrofit/retrofit.dart';

part "movies_datasource.g.dart";

@RestApi()
abstract class MovieDatasource implements IMovieRepository {
  factory MovieDatasource(Dio dio, {String baseUrl}) = _MovieDatasource;

  @override
  @GET("movies")
  Future getMovies();
}
