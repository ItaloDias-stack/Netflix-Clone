import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_movie_repository.dart';
import 'package:netfix_clone/src/presentation/usecases/i_create_movie_uc.dart';
import 'package:netfix_clone/src/utils/misc.dart';

class CreateMovieUseCase implements ICreateMovieUseCase {
  @override
  Future<bool> call({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    try {
      await GetIt.I.get<IMovieRepository>().createMovie(body: body);
      return true;
    } catch (e) {
      if (e is DioError) {
        showMessage(e.response!.data["mensagem"], Colors.red, context);
      } else {
        showMessage("Erro ao cadastrar o filme", Colors.red, context);
      }
      return false;
    }
  }
}
