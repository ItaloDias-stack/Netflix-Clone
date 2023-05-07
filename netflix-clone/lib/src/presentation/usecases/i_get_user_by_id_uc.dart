import 'package:flutter/material.dart';
import 'package:netfix_clone/src/external/models/user.dart';

abstract class IGetUserByIdUseCase {
  Future<User?> call({required int id});
}
