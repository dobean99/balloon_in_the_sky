import 'package:balloon_in_the_sky/config/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Balloon extends SpriteComponent with TapCallbacks {
  final double speed;
  final double balloonSize;
  final BalloonColor balloonColor;

  Balloon(
      {required this.speed,
      required this.balloonSize,
      required this.balloonColor});
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(getBalloonColor(balloonColor));
  }

  @override
  void update(double dt) {
    y = y - speed;
    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    removeFromParent();
    if (!event.handled) {
      final touchPoint = event.canvasPosition;
      print('touchPoint $touchPoint');
    }
    print('tap on balloon');
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

  String getBalloonBurstColor(BalloonColor balloonColor) {
    switch (balloonColor) {
      case BalloonColor.blueBalloon:
        return PngAssets.blueBurstBalloon;
      case BalloonColor.redBalloon:
        return PngAssets.blueBurstBalloon;
      case BalloonColor.whiteBalloon:
        return PngAssets.blueBurstBalloon;
    }
  }
}

enum BalloonColor {
  blueBalloon,
  redBalloon,
  whiteBalloon,
}
