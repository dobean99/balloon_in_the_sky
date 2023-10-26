import 'dart:math';
import 'package:balloon_in_the_sky/features/game_screen/sprites/balloon.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class BalloonInTheSky extends FlameGame {
  late int totalPoint = 0;
  late TextComponent playScore;

  @override
  bool debugMode = true;

  @override
  Future<void> onLoad() async {
    // SpriteComponent background = SpriteComponent()
    //   ..sprite = await loadSprite(PngAssets.background)
    //   ..size = size;
    // add(background);
    createScoreText();
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

  void createScoreText() {
    TextPaint textPaint = TextPaint(
      style: const TextStyle(
        fontSize: 48.0,
      ),
    );
    playScore = TextComponent(
      text: totalPoint.toString(),
      textRenderer: textPaint,
      position: Vector2(size.x / 2, 40),
    );
    add(playScore);
  }

  @override
  void update(double dt) {
    playScore.text = totalPoint.toString();
    super.update(dt);
  }
}
