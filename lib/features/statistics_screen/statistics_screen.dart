import 'package:balloon_in_the_sky/config/assets/assets.dart';
import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:balloon_in_the_sky/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late int blue = 0, red = 0, white = 0;

  Future<void> loaData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      red = pref.getInt(AppConstants.redBalloon) ?? 0;
      blue = pref.getInt(AppConstants.blueBalloon) ?? 0;
      white = pref.getInt(AppConstants.whiteBalloon) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    loaData();
    return BaseLayout(
      isLogoBackground: false,
      headerText: context.l10n!.statistics,
      body: Column(
        children: [
          CustomResultRow(
              imageBallon: PngAssets.whiteBalloonBG, numberBalloon: white),
          CustomResultRow(
              imageBallon: PngAssets.blueBalloonBG, numberBalloon: blue),
          CustomResultRow(
              imageBallon: PngAssets.redBalloonBG, numberBalloon: red),
        ],
      ),
    );
  }
}

class CustomResultRow extends StatelessWidget {
  const CustomResultRow({
    super.key,
    required this.numberBalloon,
    this.imageBallon,
  });

  final int numberBalloon;
  final String? imageBallon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingResult),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
          ),
          RoundedGradientStrokeButton(
            width: AppConstants.widthContainerResult,
            height: AppConstants.widthContainerResult,
            borderRadius: AppConstants.borderRadiusResult,
            child: Image.asset(imageBallon ?? PngAssets.whiteBalloonBG),
          ),
          const SizedBox(
            width: 20,
          ),
          GradientStrokeText(
            text: "X$numberBalloon",
            gradient: AppColors.blackToGrey,
          ),
        ],
      ),
    );
  }
}
