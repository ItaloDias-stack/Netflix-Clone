import 'package:flutter/material.dart';
import 'package:netfix_clone/src/presentation/views/custom_loader_screen/custom_loader_screen.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen_admin.dart';
import 'package:netfix_clone/src/presentation/views/login_screen/login_screen.dart';
import 'package:netfix_clone/src/presentation/views/movie_screen/movie_detais_screen.dart';
import 'package:netfix_clone/src/presentation/views/player_screen/player_screen.dart';
import 'package:netfix_clone/src/presentation/views/profile_screen/profile_screen.dart';
import 'package:netfix_clone/src/presentation/views/sign_up_screen/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (_) => const LoginScreen(),
  SignUpScreen.routeName: (_) => const SignUpScreen(),
  CustomLoaderScreen.routeName: (_) => const CustomLoaderScreen(),
  HomeScreen.routeName: (_) => const HomeScreen(),
  ProfileScreen.routeName: (_) => const ProfileScreen(),
  MovieDetailsScreen.routeName: (_) => const MovieDetailsScreen(),
  PlayerScreen.routeName: (_) => const PlayerScreen(),
  HomeScreenAdmin.routeName: (_) => const HomeScreenAdmin(),
};
