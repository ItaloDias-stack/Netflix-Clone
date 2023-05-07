import 'package:dio/dio.dart';
import 'package:netfix_clone/src/domain/repositories/i_user_repository.dart';
import 'package:retrofit/retrofit.dart';

part "user_datasource.g.dart";

@RestApi()
abstract class UserDatasource implements IUserRepository {
  factory UserDatasource(Dio dio, {String baseUrl}) = _UserDatasource;

  @override
  @POST("login")
  Future login({@Body() required Map<String, dynamic> body});

  @override
  @POST("users")
  Future createUser({@Body() required Map<String, dynamic> body});

  @override
  @GET("users/{id}")
  Future getUserById({@Path("id") required int id});
}
