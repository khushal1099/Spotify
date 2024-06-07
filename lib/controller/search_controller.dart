import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:spotify/utils/ListUtils.dart';

class Searchcontroller extends GetxController {
  RxDouble offset = 0.0.obs;
  RxList<Audio> serahcList = <Audio>[].obs;

  void serchSong(String song) {
    List<Audio> result = [];
    if (song.isEmpty) {
      result = allsongs;
    } else {
      result = allsongs
          .where((element) => element.metas.title
              .toString()
              .toLowerCase()
              .contains(song.toLowerCase()))
          .toList();
    }
    serahcList.value = result;
  }
}
