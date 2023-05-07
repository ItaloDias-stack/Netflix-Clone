import 'package:flutter/material.dart';

abstract class ILoginUseCase {
  Future<bool> call(
      {required Map<String, dynamic> body, required BuildContext context});
}
