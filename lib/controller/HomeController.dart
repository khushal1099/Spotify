import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Audio?> selectedAudio = Rx(null);
  Rx<List<Audio>> selectedPlayList = Rx([]);
}
