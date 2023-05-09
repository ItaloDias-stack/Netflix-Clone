import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/stores/user_store.dart';
import 'package:netfix_clone/src/presentation/views/add_movie_screen/add_movie_screen.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen.dart';
import 'package:netfix_clone/src/presentation/views/player_screen/player_screen.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_screen_loader.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});
  static const routeName = "movie_details_screen";
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final movieStore = GetIt.I.get<MovieStore>();
  final userStore = GetIt.I.get<UserStore>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(
          context,
          HomeScreen.routeName,
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        body: Observer(builder: (context) {
          return movieStore.loading
              ? const Center(child: CustomScreenLoader())
              : Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            movieStore.selectedMovie.posterUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    if (userStore.user.role == "admin")
                      Positioned(
                        top: 20,
                        right: 20,
                        child: SafeArea(
                            child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                movieStore.isEditing = true;
                                Navigator.pushNamed(
                                  context,
                                  AddMovieScreen.routeName,
                                );
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.edit_square,
                                    color: CustomColors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () async {
                                await movieStore.deleteMovie(context: context);
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.delete,
                                    color: CustomColors.secondary,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieStore.selectedMovie.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: CustomColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                PlayerScreen.routeName,
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: CustomColors.white,
                                      borderRadius: BorderRadius.circular(150),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "Play",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: CustomColors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                movieStore.selectedMovie.director,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: CustomColors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                movieStore.selectedMovie.year.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: CustomColors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            movieStore.selectedMovie.sinopse,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: CustomColors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
