import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioHelper {
  static AudioPlayer player = AudioPlayer();
  

  Future<void> soundAndRing(String url) async {
    player = AudioPlayer();

    try {
      if (player.playing) {
        player.stop();
      }
      await player.setUrl(url);
      player.setVolume(1);
      player.play();

      player.setLoopMode(LoopMode.off);
    } catch (error) {
      print('audio error: ${error.toString()}');
    }
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

}

class PositionData {
  Duration position;
  Duration duration;
  Duration bufferedPosition;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
