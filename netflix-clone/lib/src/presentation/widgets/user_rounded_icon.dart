import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:netfix_clone/src/utils/custom_colors.dart';

class UserRoundedIcon extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final double imageHeight;
  final double imageWidth;
  final String username;
  const UserRoundedIcon({
    super.key,
    required this.width,
    required this.height,
    this.imageHeight = 20,
    this.imageWidth = 20,
    required this.imageUrl,
    this.username = "",
  });

  Color getRandomColor() {
    Random random = Random();
    int r = random.nextInt(230);
    int g = random.nextInt(240);
    int b = random.nextInt(220);

    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: imageUrl == null && username.isEmpty
          ? Center(
              child: Icon(
                Icons.person,
                size: width - 10,
              ),
            )
          : username.isNotEmpty && imageUrl == null
              ? Center(
                  child: Text(
                    username[0],
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: CustomColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              : const SizedBox.shrink(),
      decoration: BoxDecoration(
        color: imageUrl != null || username.isEmpty
            ? CustomColors.primary
            : getRandomColor(),
        borderRadius: BorderRadius.circular(100),
        border:
            imageUrl != null ? null : Border.all(color: CustomColors.secondary),
        image: imageUrl != null
            ? DecorationImage(
                image: imageUrl!.contains("http")
                    ? CachedNetworkImageProvider(
                        imageUrl!,
                      )
                    : FileImage(File(imageUrl!)) as ImageProvider,
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }
}
