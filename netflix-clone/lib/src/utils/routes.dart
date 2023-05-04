import 'package:flutter/material.dart';
import 'package:netfix_clone/src/presentation/views/custom_loader_screen/custom_loader_screen.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen.dart';
import 'package:netfix_clone/src/presentation/views/login_screen/login_screen.dart';
import 'package:netfix_clone/src/presentation/views/sign_up_screen/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (_) => const LoginScreen(),
  SignUpScreen.routeName: (_) => const SignUpScreen(),
  CustomLoaderScreen.routeName: (_) => const CustomLoaderScreen(),
  HomeScreen.routeName: (_) => const HomeScreen(),
};
