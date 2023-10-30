import 'package:balloon_in_the_sky/config/assets/assets.dart';
import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/features/menu_screen/menu_screen.dart';
import 'package:balloon_in_the_sky/features/shared/commons/gradient_stroke_text.dart';
import 'package:balloon_in_the_sky/features/shared/commons/rounded_gradient_stroke_button.dart';
import 'package:balloon_in_the_sky/features/theme_screen/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout(
      {super.key,
      this.bottomButton,
      this.isLogoBackground = true,
      this.body,
      this.headerText});
  final String? headerText;
  final Widget? body;
  final Widget? bottomButton;
  final bool isLogoBackground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              context.watch<ThemeProvider>().backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: isLogoBackground ? 130 : 90,
                  ),
                  isLogoBackground
                      ? Column(
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
                        )
                      : GradientStrokeText(
                          text: headerText ?? '',
                          gradient: AppColors.blackToGrey),
                  const SizedBox(
                    height: 60,
                  ),
                  body ?? Container(),
                ],
              ),
              Positioned(
                bottom: 0,
                child: bottomButton ??
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: RoundedGradientStrokeButton(
                        isCircleButton: true,
                        child: Image.asset(PngAssets.homeIcon),
                        onPressed: () {
                          Navigator.popUntil(
                              context, ModalRoute.withName('/MenuScreen'));
                        },
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
