import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/features/shared/shared.dart';
import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90.0,
          ),
          GradientStrokeText(
              text: context.l10n!.theme, gradient: AppColors.blackToGrey),
          const SizedBox(
            height: 90.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 50,
              ),
              CustomBoxDecoration(),
              Icon(
                Icons.arrow_forward_ios,
                size: 50,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          RoundedGradientStrokeButton(
            child: Text(
              context.l10n!.select.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onPressed: () {},
          )
        ],
      ),
    ));
  }
}
