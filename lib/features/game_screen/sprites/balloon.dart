import 'package:balloon_in_the_sky/config/config.dart';
import 'package:balloon_in_the_sky/features/game_screen/sprites/balloon_in_the_sky.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Balloon extends SpriteComponent
    with HasGameRef<BalloonInTheSky>, TapCallbacks {
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
}

enum BalloonColor {
  blueBalloon,
  redBalloon,
  whiteBalloon,
}

class BalloonBurst extends SpriteComponent {
  final double balloonSize;
  final BalloonColor balloonColor;

  BalloonBurst(Vector2 position, this.balloonSize, this.balloonColor)
      : super(
          position: position,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(getBalloonBurstColor(balloonColor));
    super.onLoad();
  }

  String getBalloonBurstColor(BalloonColor balloonColor) {
    switch (balloonColor) {
      case BalloonColor.blueBalloon:
        return PngAssets.blueBurstBalloon;
      case BalloonColor.redBalloon:
        return PngAssets.redBurstBalloon;
      case BalloonColor.whiteBalloon:
        return PngAssets.whiteBurstBalloon;
    }
  }
}
