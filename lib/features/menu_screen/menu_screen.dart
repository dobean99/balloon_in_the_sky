import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/features/game_screen/game_screen.dart';
import 'package:balloon_in_the_sky/features/settings_screen/settings_screen.dart';
import 'package:balloon_in_the_sky/features/shared/commons/commons.dart';
import 'package:balloon_in_the_sky/features/shared/commons/rounded_gradient_stroke_button.dart';
import 'package:balloon_in_the_sky/features/statistics_screen/statistics_screen.dart';
import 'package:balloon_in_the_sky/features/theme_screen/theme_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: RoundedGradientStrokeButton(
          isCircleButton: true,
          child: const Icon(
            Icons.stacked_bar_chart,
            size: 25,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StatisticsScreen()),
            );
          },
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientStrokeText(
                        text: context.l10n!.balloonIn,
                        gradient: AppColors.blackToGrey),
                    GradientStrokeText(
                        text: context.l10n!.theSky,
                        gradient: AppColors.blackToGrey),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                RoundedGradientStrokeButton(
                  child: Text(
                    context.l10n!.play.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24, color: AppColors.whiteColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameScreen()),
                    );
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                RoundedGradientStrokeButton(
                  child: Text(
                    context.l10n!.theme.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24, color: AppColors.whiteColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThemeScreen()),
                    );
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                RoundedGradientStrokeButton(
                  child: Text(
                    context.l10n!.settings.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24, color: AppColors.whiteColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()),
                    );
                  },
                ),
                // const SizedBox(
                //   height: 25.0,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
