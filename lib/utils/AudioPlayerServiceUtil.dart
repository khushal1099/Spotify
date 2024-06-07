import 'package:assets_audio_player/assets_audio_player.dart';

class AudioPlayerService {
  static final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  static AssetsAudioPlayer get instance => _audioPlayer;

  AudioPlayerService._();
}
