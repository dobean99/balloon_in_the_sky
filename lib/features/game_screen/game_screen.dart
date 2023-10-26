import 'package:balloon_in_the_sky/features/game_screen/sprites/my_game.dart';
import 'package:balloon_in_the_sky/features/shared/commons/commons.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: GameWidget(
          game: MyGame(),
        ),
      ),
    );
  }
}
