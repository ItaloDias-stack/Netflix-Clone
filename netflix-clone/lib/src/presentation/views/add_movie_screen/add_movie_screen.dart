import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_button.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_screen_loader.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_scroll_with_expanded.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_text_form_field.dart';
import 'package:netfix_clone/src/presentation/widgets/field_validator.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:netfix_clone/src/utils/enums.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});
  static const routeName = "add_movie_screen";
  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final movieNameController = TextEditingController();
  final directorController = TextEditingController();
  final yearController = TextEditingController();
  final sinopseController = TextEditingController();
  final posterUrlController = TextEditingController();
  final trailerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final movieStore = GetIt.I.get<MovieStore>();
  buildMovieData() {
    return {
      "title": movieNameController.text,
      "director": directorController.text,
      "year": int.parse(yearController.text),
      "sinopse": sinopseController.text,
      "url": posterUrlController.text,
      "trailer": trailerController.text,
    };
  }

  @override
  void initState() {
    if (movieStore.isEditing) {
      movieNameController.text = movieStore.selectedMovie.title;
      directorController.text = movieStore.selectedMovie.director;
      yearController.text = movieStore.selectedMovie.year.toString();
      sinopseController.text = movieStore.selectedMovie.sinopse;
      posterUrlController.text = movieStore.selectedMovie.posterUrl;
      trailerController.text = movieStore.selectedMovie.trailer;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SafeArea(
        child: Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: movieStore.loading
                ? const Center(
                    child: CustomScreenLoader(),
                  )
                : Form(
                    key: _formKey,
                    child: CustomExpandedWithScroll(
                      children: [
                        const Spacer(),
                        Text(
                          "Adicionar filme",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: CustomColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fillColor: CustomColors.textFieldColor,
                          filled: true,
                          controller: movieNameController,
                          isPassword: false,
                          placeholderText: "Nome do filme",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorResult(
                                statusText: "Campo obrigatório",
                                validatorStatus: ValidatorStatus.error,
                              );
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          border: Border.all(
                            color: CustomColors.mediumGrey200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fillColor: CustomColors.textFieldColor,
                          filled: true,
                          controller: directorController,
                          isPassword: false,
                          placeholderText: "Diretor",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorResult(
                                statusText: "Campo obrigatório",
                                validatorStatus: ValidatorStatus.error,
                              );
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          border: Border.all(
                            color: CustomColors.mediumGrey200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fillColor: CustomColors.textFieldColor,
                          filled: true,
                          controller: yearController,
                          keyboardType: TextInputType.number,
                          isPassword: false,
                          placeholderText: "Ano de lançamento",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorResult(
                                statusText: "Campo obrigatório",
                                validatorStatus: ValidatorStatus.error,
                              );
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          border: Border.all(
                            color: CustomColors.mediumGrey200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fillColor: CustomColors.textFieldColor,
                          filled: true,
                          controller: sinopseController,
                          isPassword: false,
                          placeholderText: "Sinopse",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorResult(
                                statusText: "Campo obrigatório",
                                validatorStatus: ValidatorStatus.error,
                              );
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          border: Border.all(
                            color: CustomColors.mediumGrey200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fillColor: CustomColors.textFieldColor,
                          filled: true,
                          controller: posterUrlController,
                          isPassword: false,
                          placeholderText: "Url do poster",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorResult(
                                statusText: "Campo obrigatório",
                                validatorStatus: ValidatorStatus.error,
                              );
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          border: Border.all(
                            color: CustomColors.mediumGrey200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fillColor: CustomColors.textFieldColor,
                          filled: true,
                          controller: trailerController,
                          isPassword: false,
                          placeholderText: "ID do trailer",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ValidatorResult(
                                statusText: "Campo obrigatório",
                                validatorStatus: ValidatorStatus.error,
                              );
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          border: Border.all(
                            color: CustomColors.mediumGrey200,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: movieStore.isEditing
                              ? "Editar filme"
                              : "Adicionar filme",
                          border: Border.all(
                            color: CustomColors.secondary,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 83,
                            vertical: 1,
                          ),
                          buttonHeight: 42,
                          buttonTextStyle: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: CustomColors.secondary,
                              ),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              movieStore.movieRegisterData = buildMovieData();
                              movieStore.createOrUpdateAMovie(context: context);
                            }
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
          );
        }),
      ),
    );
  }
}
