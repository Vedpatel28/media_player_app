import 'package:af_media_player_app/controllers/video_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class video_page extends StatelessWidget {
  const video_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Consumer<VideoController>(
      builder: (context, provider, _) => Container(
        child: provider.videoPlayerController.value.isInitialized
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio:
                        provider.videoPlayerController.value.aspectRatio,
                    child: Chewie(
                      controller: provider.chewieController,
                    ),
                  ),
                  SizedBox(
                    height: s.height * 0.58,
                    child: GridView.builder(
                      itemCount: provider.videoList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                      itemBuilder: (context, index) => SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: GestureDetector(
                          onTap: () {
                            provider.indexPlay(index: index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              height: s.height * 0.2,
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.primaries[index % 18],
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),

                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
