import 'package:balloon_in_the_sky/config/config.dart';
import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/features/shared/commons/rounded_gradient_stroke_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_colors.dart';
import '../shared/shared.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            RoundedGradientStrokeButton(
              child: Text(
                context.l10n!.play.toUpperCase(),
                style:
                    const TextStyle(fontSize: 24, color: AppColors.whiteColor),
              ),
              onPressed: () {},
            ),
            RoundedGradientStrokeButton(
              child: Text(
                context.l10n!.theme.toUpperCase(),
                style:
                    const TextStyle(fontSize: 24, color: AppColors.whiteColor),
              ),
              onPressed: () {},
            ),
            RoundedGradientStrokeButton(
              child: Text(
                context.l10n!.settings.toUpperCase(),
                style:
                    const TextStyle(fontSize: 24, color: AppColors.whiteColor),
              ),
              onPressed: () {},
            ),
            RoundedGradientStrokeButton(
              child: SvgPicture.asset(
                SvgAssets.statisticsIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
