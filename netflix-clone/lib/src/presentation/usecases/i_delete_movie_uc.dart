import 'package:flutter/material.dart';

abstract class IDeleteMovieUseCase {
  Future<bool> call({required int id, required BuildContext context});
}
