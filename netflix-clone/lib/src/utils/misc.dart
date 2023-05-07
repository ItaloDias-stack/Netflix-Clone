import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void printException(String identifier, e, s) {
  log(identifier);
  if (e is DioError) {
    log("${e.requestOptions.baseUrl}${e.requestOptions.path}");
    log(e.response.toString());
    log(e.error.toString());
  }
  log(e.toString());
  log(s.toString());
}

showMessage(String message, Color color, BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(message),
    ),
  );
}
