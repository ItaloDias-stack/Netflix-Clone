import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen.dart';
import 'package:netfix_clone/src/presentation/views/home_screen/home_screen_admin.dart';
import 'package:netfix_clone/src/presentation/views/login_screen/login_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:netfix_clone/src/utils/helpers/assets_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash-screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  removeNativeSplash() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didChangeDependencies() async {
    Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
      try {
        if (kIsWeb) {
          Navigator.pushNamed(
            context,
            HomeScreenAdmin.routeName,
          );
          removeNativeSplash();
        } else {
          final prefs = await SharedPreferences.getInstance();
          if (prefs.getInt("userId") != null) {
            Navigator.pushNamed(context, HomeScreen.routeName);
            removeNativeSplash();
          } else {
            //Navigator.pushNamed(context, <YOUR-AUTH-SCREEN>.routeName); //TODO
            Navigator.pushNamed(context, LoginScreen.routeName);
            removeNativeSplash();
          }
        }
      } catch (e) {
        //Navigator.pushNamed(context, <YOUR-AUTH-SCREEN>.routeName); //TODO
        Navigator.pushNamed(context, LoginScreen.routeName);
        removeNativeSplash();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              getAssetImageUrl("splash.png"),
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
