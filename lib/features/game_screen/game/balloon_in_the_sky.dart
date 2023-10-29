import 'dart:math';
import 'package:balloon_in_the_sky/features/game_screen/components/balloon.dart';
import 'package:balloon_in_the_sky/features/game_screen/overlays/home_button.dart';
import 'package:balloon_in_the_sky/features/game_screen/overlays/score.dart';
import 'package:flame/game.dart';

class BalloonInTheSky extends FlameGame {
  int totalPoint = 0;

  @override
  Future<void> onLoad() async {
    // SpriteComponent background = SpriteComponent()
    //   ..sprite = await loadSprite(PngAssets.background)
    //   ..size = size;
    // add(background);
    spawnBalloon();
    overlays.add(Score.id);
    overlays.add(HomeButton.id);
  }

  void addBalloon(
      BalloonColor balloonColor, double positionX, double speed) async {
    double randomScale = Random().nextDouble() * 0.5 + 0.5;
    final scale = Vector2(randomScale, randomScale);
    final component =
        Balloon(speed: speed, balloonSize: scale, balloonColor: balloonColor);
    component.position = Vector2(positionX, size.y);
    await add(component);
  }

  Future<void> spawnBalloon() async {
    while (true) {
      var balloonReference = [
        BalloonColor.blueBalloon,
        BalloonColor.redBalloon,
        BalloonColor.whiteBalloon
      ];
      await Future.delayed(Duration(seconds: Random().nextInt(5)));
      int index = Random().nextInt(3);
      double positionX = Random().nextDouble() * size.x;
      double speed = Random().nextDouble() * 10.0 + 2.0;
      addBalloon(balloonReference[index], positionX, speed);
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
}