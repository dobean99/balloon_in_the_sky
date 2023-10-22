import 'package:balloon_in_the_sky/config/config.dart';
import 'package:flutter/material.dart';

import 'features/loading_screen/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: const LoadingScreen(),
    );
  }
}
