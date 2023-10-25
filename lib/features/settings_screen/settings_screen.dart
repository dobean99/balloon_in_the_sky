import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/features/shared/commons/commons.dart';
import 'package:balloon_in_the_sky/features/shared/commons/rounded_gradient_stroke_button.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../menu_screen/menu_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 90.0,
              ),
              GradientStrokeText(
                  text: context.l10n!.settings,
                  gradient: AppColors.blackToGrey),
              const SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundedGradientStrokeButton(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.l10n!.sound.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: AppColors.whiteColor),
                          ),
                          Row(
                            children: [
                              RoundedGradientStrokeButton(
                                width: 70,
                                child: Text(
                                  context.l10n!.on.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.whiteColor),
                                ),
                              ),
                              RoundedGradientStrokeButton(
                                width: 70,
                                child: Text(
                                  context.l10n!.off.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.whiteColor),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundedGradientStrokeButton(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.l10n!.vibration.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: AppColors.whiteColor),
                          ),
                          Row(
                            children: [
                              RoundedGradientStrokeButton(
                                width: 70,
                                child: Text(
                                  context.l10n!.on.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.whiteColor),
                                ),
                              ),
                              RoundedGradientStrokeButton(
                                width: 70,
                                child: Text(
                                  context.l10n!.off.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.whiteColor),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundedGradientStrokeButton(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.l10n!.language.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: AppColors.whiteColor),
                          ),
                          RoundedGradientStrokeButton(
                            width: 150,
                            child: Text(
                              context.l10n!.english.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16, color: AppColors.whiteColor),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 90.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: RoundedGradientStrokeButton(
              isCircleButton: true,
              child: const Icon(
                Icons.home_filled,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}