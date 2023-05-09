import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:netfix_clone/src/presentation/stores/movies_store.dart';
import 'package:netfix_clone/src/presentation/views/movie_screen/movie_detais_screen.dart';
import 'package:netfix_clone/src/presentation/views/player_screen/components/flick_portrait_colors.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  static const routeName = "player_screen";
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with WidgetsBindingObserver {
  final movieStore = GetIt.I.get<MovieStore>();

  late FlickManager flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "https://drive.google.com/uc?id=${movieStore.selectedMovie.trailer}&export=download",
      ),
    );
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

      await Future.delayed(const Duration(milliseconds: 500));

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    });

    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MovieDetailsScreen.routeName,
            (routes) => routes.isFirst,
          );
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                FlickVideoPlayer(
                  flickManager: flickManager,
                  preferredDeviceOrientation: const [
                    DeviceOrientation.landscapeRight,
                    DeviceOrientation.landscapeLeft
                  ],
                  flickVideoWithControls: FlickVideoWithControls(
                    controls: CustomFlickPortraitControls(
                      flickManager: flickManager,
                      fontSize: 17,
                      progressBarSettings: FlickProgressBarSettings(
                        backgroundColor: CustomColors.primary,
                        playedColor: CustomColors.secondary,
                        handleColor: CustomColors.secondary,
                        height: 4,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
