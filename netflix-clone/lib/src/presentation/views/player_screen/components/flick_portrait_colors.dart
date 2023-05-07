import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/views/movie_screen/movie_detais_screen.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:netfix_clone/src/utils/helpers/assets_helper.dart';

class CustomFlickPortraitControls extends StatefulWidget {
  const CustomFlickPortraitControls({
    Key? key,
    this.iconSize = 20,
    this.fontSize = 12,
    this.flickManager,
    this.progressBarSettings,
  }) : super(key: key);

  final double iconSize;
  final FlickManager? flickManager;
  final double fontSize;
  final FlickProgressBarSettings? progressBarSettings;
  @override
  State<CustomFlickPortraitControls> createState() =>
      _CustomFlickPortraitControlsState();
}

class _CustomFlickPortraitControlsState
    extends State<CustomFlickPortraitControls> {
  final movieStore = GetIt.I.get<MovieStore>();
  bool showComments = false;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Stack(
        children: <Widget>[
          Positioned.fill(
            child: FlickAutoHideChild(
              child: Container(
                color: CustomColors.black.withOpacity(.6),
              ),
            ),
          ),
          Positioned.fill(
            child: FlickShowControlsAction(
              child: FlickSeekVideoAction(
                seekForward: () {},
                seekBackward: () {},
                forwardSeekIcon: const SizedBox.shrink(),
                backwardSeekIcon: const SizedBox.shrink(),
                duration: const Duration(seconds: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlickAutoHideChild(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.flickManager != null) {
                              widget.flickManager!.flickControlManager!
                                  .seekBackward(const Duration(seconds: 15));
                            }
                          },
                          child: SvgPicture.asset(
                            getAssetVectorUrl("seek_backward.svg"),
                          ),
                        ),
                      ),
                      FlickVideoBuffer(
                        child: FlickAutoHideChild(
                          showIfVideoNotInitialized: false,
                          child: FlickPlayToggle(
                            size: 70,
                            playChild: const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.black,
                              size: 50,
                            ),
                            pauseChild: const Icon(
                              Icons.pause_rounded,
                              color: Colors.black,
                              size: 50,
                            ),
                            color: Colors.black,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      FlickAutoHideChild(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.flickManager != null) {
                              widget.flickManager!.flickControlManager!
                                  .seekForward(const Duration(seconds: 15));
                            }
                          },
                          child: SvgPicture.asset(
                            getAssetVectorUrl("seek_foward.svg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: FlickAutoHideChild(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  MovieDetailsScreen.routeName,
                                  (routes) => routes.isFirst,
                                );
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 30,
                                color: CustomColors.secondary,
                              ),
                            ),
                            const SizedBox(width: 17.88),
                            Text(
                              movieStore.selectedMovie.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: CustomColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: FlickAutoHideChild(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FlickVideoProgressBar(
                            flickProgressBarSettings:
                                widget.progressBarSettings,
                          ),
                        ),
                        const SizedBox(width: 28),
                        const FlickLeftDuration(
                          fontSize: 17,
                        ),
                        // const SizedBox(width: 10),
                        // FlickFullScreenToggle(
                        //   size: widget.iconSize,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
