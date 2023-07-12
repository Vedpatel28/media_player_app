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
                  SizedBox(height: s.height * 0.18),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 8,
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio:
                          provider.videoPlayerController.value.aspectRatio,
                      child: Chewie(
                        controller: provider.chewieController,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          provider.indexPlay(index: index);
                        },
                        title: Text("Video : ${provider.videoList[index]}",
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: provider.videoList.length,
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}



// SizedBox(height: s.height * 0.002),
// SizedBox(
//   height: s.height * 0.45,
//   child: GridView.builder(
//     itemCount: provider.videoList.length,
//     gridDelegate:
//         const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 1,
//       mainAxisSpacing: 10,
//       childAspectRatio: 2 / 1,
//     ),
//     itemBuilder: (context, index) => Column(
//       children: [
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.primaries[index % 18],
//             ),
//           ),
//         ),
//         Expanded(
//             child: Container(
//           decoration: BoxDecoration(
//             color: Colors.primaries[(index + 1) % 18],
//           ),
//         )),
//       ],
//     ),
//   ),
// ),