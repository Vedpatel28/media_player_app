import 'dart:ui';

import 'package:af_media_player_app/views/screen/song_page.dart';
import 'package:af_media_player_app/views/screen/video_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Select Media",
          style: GoogleFonts.songMyung(
            textStyle: TextStyle(
              fontSize: s.height * 0.03,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.music_note_outlined,
                    color: Colors.white,
                    size: s.height * 0.03,
                  ),
                  SizedBox(width: s.width * 0.04),
                  Text(
                    "Music",
                    style: GoogleFonts.songMyung(
                      textStyle: TextStyle(
                        fontSize: s.height * 0.025,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_collection_outlined,
                    color: Colors.white,
                    size: s.height * 0.03,
                  ),
                  SizedBox(width: s.width * 0.04),
                  Text(
                    "Videos",
                    style: GoogleFonts.songMyung(
                      textStyle: TextStyle(
                        fontSize: s.height * 0.025,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black54,
          image: DecorationImage(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1582220107107-590dc8b0fad3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG11c2ljJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: TabBarView(
            controller: tabController,
            children: const [
              song_page(),
              video_page(),
            ],
          ),
        ),
      ),
    );
  }
}
