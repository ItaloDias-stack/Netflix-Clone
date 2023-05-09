import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/stores/user_store.dart';
import 'package:netfix_clone/src/presentation/views/add_movie_screen/add_movie_screen.dart';
import 'package:netfix_clone/src/presentation/views/movie_screen/movie_detais_screen.dart';
import 'package:netfix_clone/src/presentation/views/profile_screen/profile_screen.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_screen_loader.dart';
import 'package:netfix_clone/src/presentation/widgets/user_rounded_icon.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:netfix_clone/src/utils/helpers/assets_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final movieStore = GetIt.I.get<MovieStore>();
  final userStore = GetIt.I.get<UserStore>();
  @override
  void initState() {
    movieStore.getAllMovies(context: context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt("userId");
      if (id != null) {
        await userStore.getUserById(id: id);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: userStore.user.role == "admin"
          ? FloatingActionButton(
              backgroundColor: CustomColors.secondary,
              child: const Center(
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                movieStore.isEditing = false;
                Navigator.pushNamed(
                  context,
                  AddMovieScreen.routeName,
                );
              },
            )
          : null,
      backgroundColor: CustomColors.primary,
      body: Observer(builder: (context) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: movieStore.loading || userStore.loading
                ? const CustomScreenLoader()
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            getAssetVectorUrl("full_name_logo.svg"),
                            width: 100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ProfileScreen.routeName,
                              );
                            },
                            child: const UserRoundedIcon(
                              width: 50,
                              height: 50,
                              imageUrl: null,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              ...movieStore.movies
                                  .map(
                                    (movie) => GestureDetector(
                                      onTap: () {
                                        movieStore.setSelectedMovie(movie);
                                        Navigator.pushNamed(
                                          context,
                                          MovieDetailsScreen.routeName,
                                        );
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(movie.posterUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
