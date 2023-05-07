import 'package:flutter/material.dart';

abstract class ICreateUserUseCase {
  Future<bool> call(
      {required Map<String, dynamic> body, required BuildContext context});
}
