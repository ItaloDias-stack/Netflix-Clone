import 'package:flutter/material.dart';

abstract class IUpdateMovieUseCase {
  Future<bool> call({
    required BuildContext context,
    required int id,
    required Map<String, dynamic> body,
  });
}
