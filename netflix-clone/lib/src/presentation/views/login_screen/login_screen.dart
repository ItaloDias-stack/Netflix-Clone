import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen.dart';
import 'package:netfix_clone/src/presentation/views/sign_up_screen/sign_up_screen.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_button.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_scroll_with_expanded.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_text_form_field.dart';
import 'package:netfix_clone/src/presentation/widgets/field_validator.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:netfix_clone/src/utils/enums.dart';
import 'package:netfix_clone/src/utils/helpers/assets_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomExpandedWithScroll(
            children: [
              const Spacer(),
              SvgPicture.asset(
                getAssetVectorUrl("full_name_logo.svg"),
                width: 150,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                fillColor: CustomColors.textFieldColor,
                filled: true,
                isPassword: false,
                placeholderText: "Login",
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
                text: "Login",
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
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                },
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                child: RichText(
                  text: TextSpan(
                    text: "Ainda não possui uma conta? ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: CustomColors.white.withOpacity(.45),
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Cadastre-se!',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: CustomColors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
