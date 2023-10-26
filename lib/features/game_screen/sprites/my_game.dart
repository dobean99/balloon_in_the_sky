import 'dart:math';
import 'package:balloon_in_the_sky/features/game_screen/sprites/balloon.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame {
  late int totalPoint;
  @override
  bool debugMode = true;

  @override
  Future<void> onLoad() async {
    // SpriteComponent background = SpriteComponent()
    //   ..sprite = await loadSprite(PngAssets.background)
    //   ..size = size;
    // add(background);
    spawnBalloon();
  }

  void addBalloon(
      BalloonColor balloonColor, double positionX, double speed) async {
    final component =
        Balloon(speed: speed, balloonSize: 20, balloonColor: balloonColor);
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

  void createScoreText() {}
  @override
  void update(double dt) {
    super.update(dt);
  }
}
