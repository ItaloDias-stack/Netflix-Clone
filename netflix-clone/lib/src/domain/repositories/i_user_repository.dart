abstract class IUserRepository {
  Future login({required Map<String, dynamic> body});
  Future createUser({required Map<String, dynamic> body});
  Future getUserById({required int id});
}
