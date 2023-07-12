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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select Media",
          style: GoogleFonts.songMyung(
            textStyle: TextStyle(
              fontSize: s.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.music_note_outlined,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.video_collection_outlined,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          song_page(),
          video_page(),
        ],
      ),
    );
  }
}
