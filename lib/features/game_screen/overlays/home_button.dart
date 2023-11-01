import 'package:balloon_in_the_sky/config/assets/png_assets.dart';
import 'package:balloon_in_the_sky/features/game_screen/game/balloon_in_the_sky.dart';
import 'package:balloon_in_the_sky/features/menu_screen/menu_screen.dart';
import 'package:balloon_in_the_sky/features/shared/commons/rounded_gradient_stroke_button.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key, required this.gameRef}) : super(key: key);
  static const String id = 'HomeButton';
  final BalloonInTheSky gameRef;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: RoundedGradientStrokeButton(
              isCircleButton: true,
              child: Image.asset(PngAssets.homeIcon),
              onPressed: () {
                gameRef.pauseEngine();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MenuScreen()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
