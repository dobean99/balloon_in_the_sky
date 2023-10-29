import 'package:balloon_in_the_sky/config/assets/assets.dart';
import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:balloon_in_the_sky/features/game_screen/game/balloon_in_the_sky.dart';
import 'package:balloon_in_the_sky/features/shared/shared.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BalloonInTheSky balloonInTheSky = BalloonInTheSky();
    return BaseLayout(
      isLogoBackground: false,
      headerText: context.l10n!.statistics,
      body: Column(
        children: [
          CustomResultRow(
              imageBallon: PngAssets.whiteBalloonBG,
              numberBalloon: balloonInTheSky.totalPoint),
          CustomResultRow(
              imageBallon: PngAssets.blueBalloonBG,
              numberBalloon: balloonInTheSky.totalPoint),
          CustomResultRow(
              imageBallon: PngAssets.redBalloonBG,
              numberBalloon: balloonInTheSky.totalPoint),
        ],
      ),
    );
  }
}

class CustomResultRow extends StatelessWidget {
  const CustomResultRow({
    super.key,
    required this.numberBalloon,
    this.imageBallon,
  });

  final int numberBalloon;
  final String? imageBallon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingResult),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
          ),
          RoundedGradientStrokeButton(
            width: AppConstants.widthContainerResult,
            height: AppConstants.widthContainerResult,
            borderRadius: AppConstants.borderRadiusResult,
            child: Image.asset(imageBallon ?? PngAssets.whiteBalloonBG),
          ),
          const SizedBox(
            width: 20,
          ),
          GradientStrokeText(
            text: "X$numberBalloon",
            gradient: AppColors.blackToGrey,
          ),
        ],
      ),
    );
  }
}
