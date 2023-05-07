import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_user_repository.dart';
import 'package:netfix_clone/src/presentation/usecases/i_login_uc.dart';
import 'package:netfix_clone/src/utils/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUseCase implements ILoginUseCase {
  @override
  Future<bool> call(
      {required Map<String, dynamic> body,
      required BuildContext context}) async {
    try {
      var response = await GetIt.I.get<IUserRepository>().login(body: body);
      if (response["user"] != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt("userId", response["user"]["id"]);
      }
      return true;
    } catch (e) {
      showMessage("Usuário ou senha incorretos", Colors.red, context);
      return false;
    }
  }
}
