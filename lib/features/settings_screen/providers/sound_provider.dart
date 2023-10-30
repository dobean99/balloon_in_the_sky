import 'package:balloon_in_the_sky/config/assets/audio_assets.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class SoundProvider extends ChangeNotifier {
  bool isSoundOn = true;
  bool isVibrationOn = true;

  void turnOnSound() {
    isSoundOn = true;
    FlameAudio.bgm.play(AudioAssets.bgAudio);
    notifyListeners();
  }

  void turnOffSound() {
    isSoundOn = false;
    stopBgmMusic();
    notifyListeners();
  }

  void stopBgmMusic() {
    FlameAudio.bgm.stop();
  }
}
