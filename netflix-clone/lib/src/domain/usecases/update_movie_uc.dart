import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_movie_repository.dart';
import 'package:netfix_clone/src/presentation/usecases/i_update_movie_uc.dart';
import 'package:netfix_clone/src/utils/misc.dart';

class UpdateMovieUseCase implements IUpdateMovieUseCase {
  @override
  Future<bool> call(
      {required BuildContext context,
      required int id,
      required Map<String, dynamic> body}) async {
    try {
      await GetIt.I.get<IMovieRepository>().updateMovie(
            body: body,
            id: id,
          );
      return true;
    } catch (e) {
      if (e is DioError) {
        showMessage(e.response!.data["mensagem"], Colors.red, context);
      } else {
        showMessage("Erro ao editar o filme", Colors.red, context);
      }
      return false;
    }
  }
}
