import 'package:balloon_in_the_sky/config/config.dart';
import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/features/game_screen/game_screen.dart';
import 'package:balloon_in_the_sky/features/loading_screen/loading_screen.dart';
import 'package:balloon_in_the_sky/features/menu_screen/menu_screen.dart';
import 'package:balloon_in_the_sky/features/settings_screen/providers/locale_provider.dart';
import 'package:balloon_in_the_sky/features/settings_screen/providers/sound_provider.dart';
import 'package:balloon_in_the_sky/features/settings_screen/providers/vibration_provider.dart';
import 'package:balloon_in_the_sky/features/settings_screen/settings_screen.dart';
import 'package:balloon_in_the_sky/features/theme_screen/theme_provider.dart';
import 'package:balloon_in_the_sky/features/theme_screen/theme_screen.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SoundProvider()),
        ChangeNotifierProvider(create: (_) => VibrationProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (context.watch<SoundProvider>().isSoundOn) {
      startBgmMusic();
    }
    return Consumer<LocaleProvider>(builder: (context, provider, snapshot) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ballon in the sky',
        theme: AppTheme.darkTheme,
        home: const LoadingScreen(),
        supportedLocales: AppLocalizations.supportedLocales,
        locale: provider.locale,
        onGenerateTitle: (context) => context.l10n!.appName,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routes: <String, WidgetBuilder>{
          '/MenuScreen': (BuildContext context) => const MenuScreen(),
          '/GameScreen': (BuildContext context) => GameScreen(),
          '/SettingsScreen': (BuildContext context) => const SettingsScreen(),
          '/ThemeScreen': (BuildContext context) => const ThemeScreen(),
        },
      );
    });
  }

  void startBgmMusic() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play(AudioAssets.bgAudio);
  }
}
