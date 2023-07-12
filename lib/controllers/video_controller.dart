import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoController extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  int indexVideo = 0;

  List<String> videoList = [
    "assets/video/animal.mp4.mp4",
    "assets/video/call.mp4.mp4",
    "assets/video/flutter.mp4.mp4",
    "assets/video/flutter2.mp4.mp4",
    "assets/video/flutter3.mp4.mp4",
    "assets/video/gader.mp4.mp4",
    "assets/video/jawan.mp4.mp4",
    "assets/video/larflutter.mp4.mp4",
    "assets/video/nullsafeflutter.mp4.mp4",
    "assets/video/prime.mp4",
  ];

  VideoController() {
    init(index: indexVideo);
  }

  init({required int index}) {
    videoPlayerController = VideoPlayerController.asset(
      videoList[index],
    )..initialize().then((value) {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: videoPlayerController.value.aspectRatio,
          autoPlay: false,
          autoInitialize: true,
        );
        notifyListeners();
      });
  }

  indexPlay({required int index}) {
    videoPlayerController.pause();
    chewieController.pause();
    init(index: index);
    videoPlayerController.play();
    chewieController.play();
  }

  play() async {
    await videoPlayerController.play();
    notifyListeners();
  }

  pause() async {
    await videoPlayerController.pause();
    notifyListeners();
  }
}
