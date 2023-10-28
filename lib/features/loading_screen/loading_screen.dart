import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/constants/app_colors.dart';
import '../shared/shared.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/MenuScreen');
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: SpinKitFadingCircle(
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
            );
          },
          size: 200.0,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
