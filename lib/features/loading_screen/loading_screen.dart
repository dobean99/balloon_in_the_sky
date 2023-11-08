import 'dart:async';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:balloon_in_the_sky/features/loading_screen/custom_spin.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../shared/shared.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Timer _timer;

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/MenuScreen');
  }

  // startTime() async {
  //   var duration = const Duration(seconds: 10);
  //   return Timer(duration, navigationPage);
  // }

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), () {
      navigationPage();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: CustomSpin(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: AppConstants.borderWidth,
                ),
                borderRadius: BorderRadius.circular(10),
                gradient: AppColors.blackToGrey,
                // color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
          size: 100.0,
          // duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
