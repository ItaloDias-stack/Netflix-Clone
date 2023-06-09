import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/presentation/stores/user_store.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_button.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_screen_loader.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_scroll_with_expanded.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_text_form_field.dart';
import 'package:netfix_clone/src/presentation/widgets/field_validator.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:netfix_clone/src/utils/enums.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "sign_up_screen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final userStore = GetIt.I.get<UserStore>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Observer(builder: (context) {
        return userStore.loading
            ? const Center(child: CustomScreenLoader())
            : Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomExpandedWithScroll(
                    children: [
                      const Spacer(),
                      Text(
                        "Crie a sua conta",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: CustomColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Para ter acesso ao aplicativo, por\nfavor complete o seu cadastro",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: CustomColors.white.withOpacity(.5),
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      const Spacer(),
                      CustomTextField(
                        controller: nameController,
                        fillColor: CustomColors.textFieldColor,
                        filled: true,
                        isPassword: false,
                        placeholderText: "Nome",
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
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: emailController,
                        fillColor: CustomColors.textFieldColor,
                        filled: true,
                        isPassword: false,
                        placeholderText: "E-mail",
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
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: passwordController,
                        fillColor: CustomColors.textFieldColor,
                        filled: true,
                        isPassword: true,
                        placeholderText: "Senha",
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
                      const SizedBox(height: 40),
                      CustomButton(
                        text: "Criar conta",
                        border: Border.all(
                          color: CustomColors.secondary,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 83,
                          vertical: 1,
                        ),
                        buttonHeight: 42,
                        buttonTextStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: CustomColors.secondary,
                                ),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await userStore.createUser(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          }
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
