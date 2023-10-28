import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomBoxDecoration extends StatelessWidget {
  final String background;
  const CustomBoxDecoration({
    super.key,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.themeBoxWidth,
      height: AppConstants.themeBoxWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusThemeBox),
        border: Border.all(
          color: AppColors.whiteColor,
          width: AppConstants.borderWidth,
        ),
      ),
    );
  }
}
