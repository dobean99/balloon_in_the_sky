import 'package:balloon_in_the_sky/config/assets/png_assets.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/features/game_screen/sprites/balloon_in_the_sky.dart';
import 'package:balloon_in_the_sky/features/shared/commons/commons.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);
  final BalloonInTheSky balloonInTheSky = BalloonInTheSky();

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: BalloonInTheSky(),
      backgroundBuilder: (context) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PngAssets.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      overlayBuilderMap: {
        Score.id: (context, BalloonInTheSky gameRef) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(top: 40, child: Score(gameRef: gameRef)),
            ],
          );
        },
      },
    );
  }
}

class Score extends StatelessWidget {
  final BalloonInTheSky gameRef;
  static const String id = 'Score';

  const Score({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return GradientStrokeText(
        text: gameRef.totalPoint.toString(), gradient: AppColors.blackToGrey);
  }
}
