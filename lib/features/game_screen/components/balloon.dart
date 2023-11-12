import 'dart:math';
import 'package:balloon_in_the_sky/config/config.dart';
import 'package:balloon_in_the_sky/features/game_screen/components/balloon_burst.dart';
import 'package:balloon_in_the_sky/features/game_screen/game/balloon_in_the_sky.dart';
import 'package:balloon_in_the_sky/features/settings_screen/providers/vibration_provider.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

enum BalloonColor {
  blueBalloon,
  redBalloon,
  whiteBalloon,
}

class Balloon extends SpriteComponent
    with HasGameRef<BalloonInTheSky>, TapCallbacks {
  final double speed;
  final Vector2 balloonSize;
  final BalloonColor balloonColor;
  Balloon(
      {required this.speed,
      required this.balloonSize,
      required this.balloonColor})
      : super(scale: balloonSize);
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(getBalloonColor(balloonColor));
    double positionX =
        Random().nextDouble() * (game.size.x - (size.x / 2)) + (size.x / 2);
    Vector2 newPosition = Vector2(positionX, game.size.y);
    position = newPosition;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    y = y - speed;
    if (position.y < -100) {
      removeFromParent();
    }
    super.update(dt);
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    removeFromParent();
    if (!event.handled) {
      final touchPoint = event.canvasPosition;
      final balloonBurst = BalloonBurst(touchPoint, balloonSize, balloonColor);
      gameRef.add(balloonBurst);
      gameRef.totalPoint += 1;
      getScore(balloonColor);
      if (game.buildContext != null) {
        if (Provider.of<VibrationProvider>(game.buildContext!, listen: false)
            .isVibrationOn) {
          Vibration.vibrate();
        }
      }
      await Future.delayed(const Duration(milliseconds: 100));
      gameRef.remove(balloonBurst);
    }
    event.handled = true;
  }

  String getBalloonColor(BalloonColor balloonColor) {
    switch (balloonColor) {
      case BalloonColor.blueBalloon:
        return PngAssets.blueBalloon;
      case BalloonColor.redBalloon:
        return PngAssets.redBalloon;
      case BalloonColor.whiteBalloon:
        return PngAssets.whiteBalloon;
    }
  }

  void getScore(BalloonColor balloonColor) {
    switch (balloonColor) {
      case BalloonColor.blueBalloon:
        gameRef.blueBalloon += 1;
        break;
      case BalloonColor.redBalloon:
        gameRef.redBalloon += 1;
        break;
      case BalloonColor.whiteBalloon:
        gameRef.whiteBalloon += 1;
        break;
    }
  }
}
