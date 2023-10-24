import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.whiteColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    gradient: AppColors.blackToGrey,
                    // color: index.isEven ? Colors.red : Colors.green,
                  ),
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                  ),
                );
              },
              size: 200.0,
              duration: const Duration(seconds: 5),
            )
          ],
        ),
      ),
    );
  }
}
