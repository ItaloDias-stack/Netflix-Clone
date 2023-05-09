import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:netfix_clone/src/external/models/user.dart';
import 'package:netfix_clone/src/presentation/usecases/i_create_user_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_user_by_id_uc.dart';
import 'package:netfix_clone/src/presentation/usecases/i_login_uc.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen_admin.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  User user = User();

  @action
  Future login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    loading = true;
    var response = await GetIt.I.get<ILoginUseCase>()(
      body: {"email": email, "password": password},
      context: context,
    );
    loading = false;
    if (response) {
      navigateByRole(context);
    }
  }

  @action
  Future createUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    loading = true;
    var response = await GetIt.I.get<ICreateUserUseCase>()(
      body: {
        "email": email,
        "password": password,
        "name": name,
        "role": "user",
      },
      context: context,
    );
    loading = false;
    if (response) {
      navigateByRole(context);
    }
  }

  @action
  Future getUserById({required int id}) async {
    loading = true;
    var response = await GetIt.I.get<IGetUserByIdUseCase>()(id: id);
    if (response != null) {
      user = response;
    }
    loading = false;
  }

  navigateByRole(BuildContext context) {
    if (user.role == "admin") {
      Navigator.pushNamed(context, HomeScreen.routeName);
    } else {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}
