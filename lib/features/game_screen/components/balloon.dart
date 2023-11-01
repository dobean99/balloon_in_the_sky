import 'package:balloon_in_the_sky/config/config.dart';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:balloon_in_the_sky/features/game_screen/components/balloon_burst.dart';
import 'package:balloon_in_the_sky/features/game_screen/game/balloon_in_the_sky.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late final SharedPreferences prefs;
  Balloon(
      {required this.speed,
      required this.balloonSize,
      required this.balloonColor})
      : super(scale: balloonSize);
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(getBalloonColor(balloonColor));
    prefs = await SharedPreferences.getInstance();
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
      Vibration.vibrate();
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
        gameRef.blueBalloon + 1;
        int blueBalloon = gameRef.blueBalloon + 1;
        prefs.setInt(AppConstants.blueBalloon, blueBalloon);
        break;
      case BalloonColor.redBalloon:
        int redBalloon = prefs.getInt(AppConstants.redBalloon) ?? 0 + 1;
        prefs.setInt(AppConstants.redBalloon, redBalloon);
        break;
      case BalloonColor.whiteBalloon:
        int whiteBalloon = prefs.getInt(AppConstants.whiteBalloon) ?? 0 + 1;
        prefs.setInt(AppConstants.whiteBalloon, whiteBalloon);
        break;
    }
  }
}
