import 'package:balloon_in_the_sky/config/assets/png_assets.dart';
import 'package:balloon_in_the_sky/features/game_screen/components/balloon.dart';
import 'package:flame/components.dart';

class BalloonBurst extends SpriteComponent {
  final Vector2 balloonSize;
  final BalloonColor balloonColor;

  BalloonBurst(Vector2 position, this.balloonSize, this.balloonColor)
      : super(
          position: position,
          anchor: Anchor.center,
          scale: balloonSize,
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
