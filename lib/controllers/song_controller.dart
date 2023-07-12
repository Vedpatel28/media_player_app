import 'package:af_media_player_app/utilse/song_util.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class SongController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  int indexSong = 0;
  Duration totalTime = Duration.zero;
  List likedSong = [];

  List<Audio> audioList = [
    Audio(
      songPath + SongList.maan,
      metas: Metas(
        image: const MetasImage.network(
            "https://static-cse.canva.com/blob/1078769/1600w-fxYFTKLArdY.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.man,
      metas: Metas(
        image: const MetasImage.network(
            "https://dw0i2gv3d32l1.cloudfront.net/uploads/stage/stage_image/21198/optimized_large_thumb_stage.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.daku,
      metas: Metas(
        image: const MetasImage.network(
            "https://images.squarespace-cdn.com/content/v1/5befb3b84611a081dd003798/1542707489945-B1W9OUIZZPMQQJVOWSR1/suzanne.jpg?format=500w"),
      ),
    ),
    Audio(
      songPath + SongList.Ankh,
      metas: Metas(
        image: const MetasImage.network(
            "https://images.squarespace-cdn.com/content/v1/5befb3b84611a081dd003798/1542707163066-IJXP9FG4CRTZ5D5PDDK7/pia.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.chalisa,
      metas: Metas(
        image: const MetasImage.network(
            "https://e0.pxfuel.com/wallpapers/271/893/desktop-wallpaper-hanuman-harish-moger-hanuman-hanuman-jayanthi-lord-hanuman-hanuman-art-thumbnail.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.dance,
      metas: Metas(
        image: const MetasImage.network(
            "https://i.pinimg.com/564x/ea/a7/36/eaa736090993ec37f35ff992e60d334c--dj-songs-arte-india.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.dil,
      metas: Metas(
        image: const MetasImage.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvefhxQYfWRZqE4HIqptzu0jCoPYC13XWwVg&usqp=CAU"),
      ),
    ),
    Audio(
      songPath + SongList.Kesri,
      metas: Metas(
        image: const MetasImage.network(
            "https://nettv4u.com/fileman/Uploads/Top-10-Bollywood-Playback-Singers-of-the-New-Era/Arijit_Singh.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.Kya,
      metas: Metas(
        image: const MetasImage.network(
            "https://rovimusic.rovicorp.com/image.jpg?c=mRqGeGrvxdwXnIREN_fHH9_M69_UI9rrJSVvWL2-yAg=&f=4"),
      ),
    ),
    Audio(
      songPath + SongList.mana,
      metas: Metas(
        image: const MetasImage.network(
            "https://stat5.bollywoodhungama.in/wp-content/uploads/2016/03/429351615-306x393.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.raatan,
      metas: Metas(
        image: const MetasImage.network(
            "https://images.squarespace-cdn.com/content/v1/5befb3b84611a081dd003798/1542707163066-IJXP9FG4CRTZ5D5PDDK7/pia.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.sun,
      metas: Metas(
        image: const MetasImage.network(
            "https://dw0i2gv3d32l1.cloudfront.net/uploads/stage/stage_image/21198/optimized_large_thumb_stage.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.tere,
      metas: Metas(
        image: const MetasImage.network(
            "https://nettv4u.com/fileman/Uploads/Top-10-Bollywood-Playback-Singers-of-the-New-Era/Arijit_Singh.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.tu,
      metas: Metas(
        image: const MetasImage.network(
            "https://static-cse.canva.com/blob/1078769/1600w-fxYFTKLArdY.jpg"),
      ),
    ),
    Audio(
      songPath + SongList.tua,
      metas: Metas(
        image: const MetasImage.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvefhxQYfWRZqE4HIqptzu0jCoPYC13XWwVg&usqp=CAU"),
      ),
    ),
  ];

  SongController() {
    init();
  }

  init() {
    assetsAudioPlayer.open(
      audioList[indexSong],
      showNotification: true,
      autoStart: (indexSong == 0) ? false : true,
    ).then((value) {
      totalTime = assetsAudioPlayer.current.value!.audio.duration;
    });
  }

  songPlay() async {
    await assetsAudioPlayer.play();
    notifyListeners();
  }

  seek({required int seconds}) async {
    await assetsAudioPlayer.seek(
      Duration(
        seconds: seconds,
      ),
    );
    notifyListeners();
  }

  songPause() async {
    await assetsAudioPlayer.pause();
    notifyListeners();
  }

  indexPlay({required int index}) async {
    await assetsAudioPlayer.stop();
    indexSong == index;
    init();
    notifyListeners();
  }

  get isStart {
    return assetsAudioPlayer.isPlaying.value;
  }

  get currentPosition {
    return assetsAudioPlayer.currentPosition;
  }

  nextSong() async {
    await assetsAudioPlayer.stop();
    (indexSong < audioList.length) ? indexSong++ : indexSong;
    init();
    notifyListeners();
  }

  prevSong() async {
    await assetsAudioPlayer.stop();
    (indexSong < audioList.length) ? indexSong-- : indexSong;
    init();
    notifyListeners();
  }
}
