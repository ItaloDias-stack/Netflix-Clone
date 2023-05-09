import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_movie_repository.dart';
import 'package:netfix_clone/src/presentation/usecases/i_delete_movie_uc.dart';
import 'package:netfix_clone/src/utils/misc.dart';

class DeleteMovieUseCase implements IDeleteMovieUseCase {
  @override
  Future<bool> call({required int id, required BuildContext context}) async {
    try {
      await GetIt.I.get<IMovieRepository>().deleteMovie(
            id: id,
          );
      return true;
    } catch (e) {
      if (e is DioError) {
        showMessage(e.response!.data["mensagem"], Colors.red, context);
      } else {
        showMessage("Erro ao remover o filme", Colors.red, context);
      }
      return false;
    }
  }
}
