import 'package:flutter/material.dart';
import 'package:netfix_clone/src/external/models/movie.dart';

abstract class IGetMoviesUseCase {
  Future<List<Movie>> call({required BuildContext context});
}
