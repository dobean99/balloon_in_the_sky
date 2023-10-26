import 'package:balloon_in_the_sky/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GradientStrokeText extends StatelessWidget {
  const GradientStrokeText({
    Key? key,
    required this.text,
    required this.gradient,
    this.strokeWidth,
  }) : super(key: key);

  final String text;
  final Gradient gradient;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = strokeWidth ?? 8
                  ..color = AppColors.whiteColor,
              ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            );
          },
          child: Text(text, style: Theme.of(context).textTheme.displayLarge),
        ),
      ],
    );
  }
}
