import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';

class RoundedGradientStrokeButton extends StatelessWidget {
  final double? borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const RoundedGradientStrokeButton(
      {super.key,
      required this.child,
      this.borderRadius,
      this.width,
      this.height,
      this.gradient,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.buttonMenuWidth,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: AppColors.blackToGrey,
        borderRadius:
            BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        border: Border.all(
          color: AppColors.whiteColor,
          width: AppConstants.borderWidth,
        ),
      ),
      child: InkWell(
        onLongPress: onPressed,
        child: Center(child: child),
      ),
    );
  }
}
