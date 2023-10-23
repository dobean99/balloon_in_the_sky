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
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth ?? 8
              ..color = Colors.white,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            );
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
