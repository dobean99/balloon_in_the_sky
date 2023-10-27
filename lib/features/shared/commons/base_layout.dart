import 'package:balloon_in_the_sky/config/config.dart';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:balloon_in_the_sky/features/menu_screen/menu_screen.dart';
import 'package:balloon_in_the_sky/features/shared/commons/rounded_gradient_stroke_button.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.child, this.bottomButton});
  final Widget child;
  final Widget? bottomButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(PngAssets.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            child,
            Positioned(
              bottom: 0,
              child: bottomButton ??
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: RoundedGradientStrokeButton(
                      isCircleButton: true,
                      child: const Icon(
                        Icons.home_filled,
                        size: AppConstants.homeIconSize,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuScreen()),
                        );
                      },
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
