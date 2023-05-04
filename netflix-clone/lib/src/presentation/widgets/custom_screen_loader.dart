import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:netfix_clone/src/utils/helpers/assets_helper.dart';

class CustomScreenLoader extends StatelessWidget {
  const CustomScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          getAssetVectorUrl("full_name_logo.svg"),
          width: 150,
        ),
        const SizedBox(height: 40),
        CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(
            CustomColors.secondary,
          ),
        ),
      ],
    );
  }
}
