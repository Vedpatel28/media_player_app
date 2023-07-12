import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoController extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  List<String> videoList = [
    "assets/video/jawan.mp4.mp4",
    "assets/video/prime.mp4",
    "assets/video/clip_of_parrot_eating_on_house_nest_6892445.mp4",
    "assets/video/clip_of_wild_bird_feeding_small_chicks_6892272.mp4",
    "assets/video/closeup_of_cute_small_bird_6892300.mp4",
    "assets/video/closeup_of_fragile_wild_butterfly_on_flower_6892054.mp4",
    "assets/video/closeup_of_small_water_flow_on_rock_6891970.mp4",
    "assets/video/cute_hairy_dog_having_sight_seeing_from_car_6892519.mp4",
    "assets/video/cute_small_bird_perching_on_tree_6892042.mp4",
    "assets/video/file_example_MP4_480_1_5MG.mp4",
    "assets/video/tiny_ant_and_wild_snake_in_nature_6892039.mp4",
    "assets/video/wild_porcupine_climbing_on_tree_in_nature_6892280.mp4",
    "assets/video/wild_woodpecker_looking_for_food_on_timber_6892044.mp4",
  ];

  VideoController() {
    init();
  }

  init({int index = 0}) {
    videoPlayerController = VideoPlayerController.asset(
      videoList[index],
    )..initialize().then((value) {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: videoPlayerController.value.aspectRatio,
          autoPlay: false,
        );
        notifyListeners();
      });
  }

  indexPlay({required int index}) {
    videoPlayerController.pause();
    chewieController.pause();
    init(index: index);
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
