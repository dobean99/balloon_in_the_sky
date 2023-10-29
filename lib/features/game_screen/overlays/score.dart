import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/features/game_screen/game/balloon_in_the_sky.dart';
import 'package:balloon_in_the_sky/features/shared/commons/gradient_stroke_text.dart';
import 'package:flutter/material.dart';

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
