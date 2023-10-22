import 'package:balloon_in_the_sky/config/assets/assets.dart';
import 'package:balloon_in_the_sky/config/config.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PngAssets.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientStrokeText(
              text: "BALLON IN",
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Theme.of(context).primaryColor,
                  const Color(0xFF6d6d6d)
                ],
              ),
            ),
            GradientStrokeText(
              text: "THE SKY",
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Theme.of(context).primaryColor,
                  const Color(0xFF6d6d6d)
                ],
              ),
            ),
          ],
        ) /* add child content here */,
      ),
    ));
  }
}

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
              ..strokeWidth = 8
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
