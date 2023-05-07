import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_user_repository.dart';
import 'package:netfix_clone/src/presentation/usecases/i_create_user_uc.dart';
import 'package:netfix_clone/src/utils/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateUserUseCase implements ICreateUserUseCase {
  @override
  Future<bool> call(
      {required Map<String, dynamic> body,
      required BuildContext context}) async {
    try {
      var response =
          await GetIt.I.get<IUserRepository>().createUser(body: body);
      if (response["status"] != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt("userId", response["status"]["id"]);
      }
      showMessage("Usuário cadastrado com sucesso", Colors.green, context);
      return true;
    } catch (e) {
      if (e is DioError) {
        showMessage(e.response!.data["mensagem"], Colors.red, context);
      } else {
        showMessage("Erro ao cadastrar o usuário", Colors.red, context);
      }
      return false;
    }
  }
}
