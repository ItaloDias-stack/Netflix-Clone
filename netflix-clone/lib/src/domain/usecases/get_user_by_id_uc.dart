import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/domain/repositories/i_user_repository.dart';
import 'package:netfix_clone/src/external/models/user.dart';
import 'package:netfix_clone/src/presentation/usecases/i_get_user_by_id_uc.dart';

class GetUserByIdUseCase implements IGetUserByIdUseCase {
  @override
  Future<User?> call({required int id}) async {
    try {
      var response = await GetIt.I.get<IUserRepository>().getUserById(id: id);
      if (response["data"] != null) {
        return User.fromJson(response["data"]);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
