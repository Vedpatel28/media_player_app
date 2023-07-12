// ignore_for_file: must_be_immutable, camel_case_types

import 'dart:ui';
import 'package:af_media_player_app/controllers/song_controller.dart';
import 'package:af_media_player_app/utilse/song_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class song_page extends StatelessWidget {
  const song_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
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
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Padding(
          padding: EdgeInsets.all(s.height * 0.01),
          child: Consumer<SongController>(builder: (context, provider, _) {
            return Stack(
              children: [
                // Classical Music
                Container(
                  height: s.height * 0.3,
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Classical Music",
                        style: GoogleFonts.songMyung(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: s.height * 0.028,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: s.height * 0.01),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            provider.audioList.length,
                            (index) => Container(
                              height: s.height * 0.22,
                              width: s.width * 0.5,
                              margin: EdgeInsets.only(right: s.width * 0.05),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(allSongCover[index]),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.primaries[index % 18],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(s.height * 0.03),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const Alignment(-0.8, 0.8),
                                    child: Container(
                                      height: s.height * 0.05,
                                      width: s.width * 0.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(s.height * 0.02),
                                        ),
                                        color: Colors.white30,
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(s.height * 0.0001),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                provider.likedSong.add(index);
                                              },
                                              icon: const Icon(
                                                Icons.favorite_border_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                provider.indexSong = index;
                                                provider.indexPlay(
                                                    index: index);

                                                // provider.isStart
                                                //     ? provider.songPause()
                                                //     : provider.indexPlay(
                                                //     index: index);
                                              },
                                              icon: const Icon(
                                                Icons.play_arrow_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Top Song
                Padding(
                  padding: EdgeInsets.only(
                      left: s.width * 0.01, top: s.height * 0.3),
                  child: Text(
                    "Top Songs",
                    style: GoogleFonts.songMyung(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: s.height * 0.028,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Top SongListview
                Padding(
                  padding: EdgeInsets.only(
                    top: s.height * 0.35,
                    bottom: s.height * 0.1,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                        provider.audioList.length,
                        (index) => ListTile(
                          // For Image
                          leading: Container(
                            height: s.height * 0.33,
                            width: s.width * 0.19,
                            margin: EdgeInsets.only(bottom: s.height * 0.001),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(allSongCover[index]),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.primaries[index % 18],
                              borderRadius: BorderRadius.all(
                                Radius.circular(s.height * 0.012),
                              ),
                            ),
                          ),
                          // For Title
                          title: Text(
                            "Song Title",
                            style: GoogleFonts.songMyung(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: s.height * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // For SubTitle
                          subtitle: Text(
                            "SubTitle",
                            style: GoogleFonts.songMyung(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: s.height * 0.018,
                              ),
                            ),
                          ),
                          // For Play The Song
                          trailing: IconButton(
                            onPressed: () {
                              // provider.indexSong = index;
                              provider.indexPlay(index: index);
                              // provider.songPlay();

                              // provider.isStart
                              //     ? provider.songPause()
                              //     : provider.indexPlay(
                              //     index: index);
                            },
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: s.height * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // BottomNavigationBar Player
                Padding(
                  padding: EdgeInsets.only(top: s.height * 0.72),
                  child: Container(
                    height: s.height * 0.11,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.9),
                      borderRadius: BorderRadius.all(
                        Radius.circular(s.height * 0.05),
                      ),
                      border: Border.all(
                        width: 10,
                        color: Colors.transparent,
                      ),
                    ),
                    child: SingleChildScrollView(
                      primary: true,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StreamBuilder(
                            stream: provider.currentPosition,
                            builder:
                                (context, AsyncSnapshot<Duration> snapshot) {
                              if (snapshot.hasData) {
                                // double currentPosition = snapshot.data!.inSeconds.toDouble();
                                return Row(
                                  children: [
                                    SizedBox(width: s.width * 0.01),
                                    Container(
                                      height: s.height,
                                      width: s.width * 0.17,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            allSongCover[provider.indexSong],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(s.height * 0.04),
                                          bottomLeft:
                                              Radius.circular(s.height * 0.04),
                                        ),
                                        color: Colors
                                            .primaries[provider.indexSong % 18],
                                      ),
                                    ),
                                    SizedBox(width: s.width * 0.02),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "SongList Name",
                                          style: GoogleFonts.songMyung(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: s.height * 0.02,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: s.height * 0.001),
                                        Text(
                                          "$SongList",
                                          style: GoogleFonts.songMyung(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: s.height * 0.018,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: s.width * 0.04),
                                    IconButton(
                                      onPressed: () {
                                        provider.prevSong();
                                      },
                                      icon: Icon(
                                        Icons.skip_previous,
                                        size: s.height * 0.04,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        provider.isStart
                                            ? provider.songPause()
                                            : provider.songPlay();
                                      },
                                      icon: Icon(
                                        provider.isStart
                                            ? Icons.pause_circle
                                            : Icons.play_circle,
                                        size: s.height * 0.04,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        provider.nextSong();
                                      },
                                      icon: Icon(
                                        Icons.skip_next,
                                        size: s.height * 0.04,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          Row(
                            children: [
                              SizedBox(width: s.width * 0.11),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.music_note_outlined,
                                  size: s.height * 0.042,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: s.width * 0.082),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  size: s.height * 0.042,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: s.width * 0.082),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.home_outlined,
                                  size: s.height * 0.042,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: s.width * 0.082),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.account_circle_outlined,
                                  size: s.height * 0.042,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: s.width * 0.06),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
