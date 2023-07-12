import 'package:af_media_player_app/controllers/song_controller.dart';
import 'package:af_media_player_app/controllers/video_controller.dart';
import 'package:af_media_player_app/utilse/routes_utilse.dart';
import 'package:af_media_player_app/views/screen/home_page.dart';
import 'package:af_media_player_app/views/screen/song_page.dart';
import 'package:af_media_player_app/views/screen/video_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SongController()),
        ChangeNotifierProvider(create: (context) => VideoController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        AllRoutes.HomePage: (context) => home_page(),
        AllRoutes.SongPage: (context) => song_page(),
        AllRoutes.VideoPage: (context) => video_page(),
      },
    );
  }
}
