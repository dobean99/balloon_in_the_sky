import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../shared/shared.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

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
            // CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
