import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/views/movie_screen/movie_detais_screen.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_screen_loader.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';

class HomeScreenAdmin extends StatefulWidget {
  static const routeName = "home_screen_admin";
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  final movieStore = GetIt.I.get<MovieStore>();
  @override
  void initState() {
    movieStore.getAllMovies(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Observer(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: movieStore.loading //|| userStore.loading
                ? const CustomScreenLoader()
                : Column(
                    children: [
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
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
