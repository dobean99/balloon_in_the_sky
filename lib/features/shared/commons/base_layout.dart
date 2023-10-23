import 'package:flutter/material.dart';

import '../../../config/config.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.child});
  final Widget child;

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
        child: child,
      ),
    );
  }
}
