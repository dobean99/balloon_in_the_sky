import 'dart:math';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:balloon_in_the_sky/features/game_screen/components/balloon.dart';
import 'package:balloon_in_the_sky/features/game_screen/overlays/home_button.dart';
import 'package:balloon_in_the_sky/features/game_screen/overlays/score.dart';
import 'package:flame/game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalloonInTheSky extends FlameGame {
  int totalPoint = 0;
  int blueBalloon = 0;
  int redBalloon = 0;
  int whiteBalloon = 0;
  late final SharedPreferences prefs;

  @override
  Future<void> onLoad() async {
    // SpriteComponent background = SpriteComponent()
    //   ..sprite = await loadSprite(PngAssets.background)
    //   ..size = size;
    // add(background);
    spawnBalloon();
    overlays.add(Score.id);
    overlays.add(HomeButton.id);
    prefs = await SharedPreferences.getInstance();
  }

  void addBalloon(BalloonColor balloonColor, double speed) async {
    double randomScale = Random().nextDouble() * 0.5 + 0.5;
    final scale = Vector2(randomScale, randomScale);
    final component =
        Balloon(speed: speed, balloonSize: scale, balloonColor: balloonColor);
    await add(component);
  }

  Future<void> spawnBalloon() async {
    while (true) {
      var balloonReference = [
        BalloonColor.blueBalloon,
        BalloonColor.redBalloon,
        BalloonColor.whiteBalloon
      ];
      await Future.delayed(const Duration(milliseconds: 500));
      int index = Random().nextInt(3);
      double speed = Random().nextDouble() * 5.0 + 2.0;
      addBalloon(balloonReference[index], speed);
    }
  }

  @override
  void update(double dt) {
    if (overlays.isActive(Score.id)) {
      overlays.remove(Score.id);
      overlays.add(Score.id);
    }
    super.update(dt);
  }

  @override
  void onDispose() {
    int red = prefs.getInt(AppConstants.redBalloon) ?? 0;
    prefs.setInt(AppConstants.redBalloon, red + redBalloon);

    int blue = prefs.getInt(AppConstants.blueBalloon) ?? 0;
    prefs.setInt(AppConstants.blueBalloon, blue + blueBalloon);

    int white = prefs.getInt(AppConstants.whiteBalloon) ?? 0;
    prefs.setInt(AppConstants.whiteBalloon, white + whiteBalloon);

    super.onDispose();
  }
}
