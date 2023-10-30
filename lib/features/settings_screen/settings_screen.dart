import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/core/constants/app_constants.dart';
import 'package:balloon_in_the_sky/config/l10n/full_name_locale.dart';
import 'package:balloon_in_the_sky/features/settings_screen/providers/locale_provider.dart';
import 'package:balloon_in_the_sky/features/settings_screen/providers/sound_provider.dart';
import 'package:balloon_in_the_sky/features/settings_screen/providers/vibration_provider.dart';
import 'package:balloon_in_the_sky/features/shared/commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSoundOn = context.watch<SoundProvider>().isSoundOn;
    final isVibrationOn = context.watch<VibrationProvider>().isVibrationOn;
    return BaseLayout(
        isLogoBackground: false,
        headerText: context.l10n!.settings,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
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
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                RoundedGradientStrokeButton(
                                    width: 70,
                                    isEnabled: isSoundOn,
                                    onPressed: () {
                                      context
                                          .read<SoundProvider>()
                                          .turnOnSound();
                                    },
                                    child: Text(
                                      context.l10n!.on.toUpperCase(),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )),
                                RoundedGradientStrokeButton(
                                  width: 70,
                                  isEnabled: !isSoundOn,
                                  child: Text(
                                    context.l10n!.off.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  onPressed: () => context
                                      .read<SoundProvider>()
                                      .turnOffSound(),
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
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                RoundedGradientStrokeButton(
                                  width: 70,
                                  isEnabled: isVibrationOn,
                                  child: Text(
                                    context.l10n!.on.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<VibrationProvider>()
                                        .turnOnVibration();
                                  },
                                ),
                                RoundedGradientStrokeButton(
                                  width: 70,
                                  isEnabled: !isVibrationOn,
                                  child: Text(
                                    context.l10n!.off.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<VibrationProvider>()
                                        .turnOffVibration();
                                  },
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
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Consumer<LocaleProvider>(
                                builder: (context, provider, snapshot) {
                              var lang = provider.locale ??
                                  Localizations.localeOf(context);
                              return RoundedGradientStrokeButton(
                                width: 150,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    iconSize: 0,
                                    dropdownColor: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.borderRadiusDropdown),
                                    value: lang,
                                    items: AppLocalizations.supportedLocales
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e.fullName(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (Locale? value) {
                                      context
                                          .read<LocaleProvider>()
                                          .setLocale(value!);
                                    },
                                  ),
                                ),
                                // onPressed: () {
                                //   context.read<LocaleProvider>().setLocale(
                                //         AppLocalizations.supportedLocales[1],
                                //       );
                                // },
                              );
                            }),
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 90.0,
                ),
              ],
            ),
          ],
        ));
  }
}
