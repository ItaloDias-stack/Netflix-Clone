import 'package:flutter/material.dart';
import 'package:netfix_clone/src/presentation/views/login_screen/login_screen.dart';
import 'package:netfix_clone/src/presentation/widgets/custom_button.dart';
import 'package:netfix_clone/src/presentation/widgets/user_rounded_icon.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "profile_screen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const UserRoundedIcon(
              width: 150,
              height: 150,
              imageUrl: null,
            ),
            CustomButton(
              text: "Deslogar",
              border: Border.all(
                color: CustomColors.white,
              ),
              borderRadius: BorderRadius.circular(50),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 1,
              ),
              buttonHeight: 42,
              buttonTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: CustomColors.white,
                  ),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("userId");
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginScreen.routeName,
                  (route) => route.isFirst,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
