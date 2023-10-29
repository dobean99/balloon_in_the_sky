import 'package:balloon_in_the_sky/config/assets/png_assets.dart';
import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/features/game_screen/game_screen.dart';
import 'package:balloon_in_the_sky/features/settings_screen/settings_screen.dart';
import 'package:balloon_in_the_sky/features/shared/commons/commons.dart';
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
          child: Image.asset(PngAssets.statisticsIcon),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StatisticsScreen()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          RoundedGradientStrokeButton(
            child: Text(
              context.l10n!.play.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GameScreen()),
              );
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
          RoundedGradientStrokeButton(
            child: Text(
              context.l10n!.theme.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThemeScreen()),
              );
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
          RoundedGradientStrokeButton(
            child: Text(
              context.l10n!.settings.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
