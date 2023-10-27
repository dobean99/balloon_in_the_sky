import 'package:balloon_in_the_sky/features/game_screen/sprites/balloon_in_the_sky.dart';
import 'package:balloon_in_the_sky/features/shared/shared.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BalloonInTheSky balloonInTheSky = BalloonInTheSky();
    return BaseLayout(
      child: Center(
        child: Text(
          balloonInTheSky.totalPoint.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
