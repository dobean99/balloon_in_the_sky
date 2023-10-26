import 'package:balloon_in_the_sky/config/assets/png_assets.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomBoxDecoration extends StatelessWidget {
  const CustomBoxDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.themeBoxWidth,
      height: AppConstants.themeBoxWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PngAssets.backgroundImage),
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
