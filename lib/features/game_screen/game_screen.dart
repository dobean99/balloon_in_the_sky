import 'package:balloon_in_the_sky/features/game_screen/game/balloon_in_the_sky.dart';
import 'package:balloon_in_the_sky/features/game_screen/overlays/home_button.dart';
import 'package:balloon_in_the_sky/features/game_screen/overlays/score.dart';
import 'package:balloon_in_the_sky/features/theme_screen/theme_provider.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);
  final BalloonInTheSky balloonInTheSky = BalloonInTheSky();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: BalloonInTheSky(),
        backgroundBuilder: (context) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(context.watch<ThemeProvider>().backgroundImage),
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
          HomeButton.id: (context, BalloonInTheSky gameRef) {
            return HomeButton(gameRef: gameRef);
          }
        },
      ),
    );
  }
}
