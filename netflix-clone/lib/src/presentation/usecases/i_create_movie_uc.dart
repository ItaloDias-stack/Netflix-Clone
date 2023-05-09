import 'package:flutter/material.dart';

abstract class ICreateMovieUseCase {
  Future<bool> call({
    required BuildContext context,
    required Map<String, dynamic> body,
  });
}
