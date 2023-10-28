import 'package:balloon_in_the_sky/config/assets/assets.dart';
import 'package:balloon_in_the_sky/config/l10n/l10n.dart';
import 'package:balloon_in_the_sky/features/shared/shared.dart';
import 'package:balloon_in_the_sky/features/theme_screen/theme_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    final featuredImages = [
      PngAssets.backgroundImage,
      PngAssets.backgroundImage2,
    ];
    int currentIndex = 0;

    return BaseLayout(
      isLogoBackground: false,
      headerText: context.l10n!.theme,
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      currentIndex = index;
                      // setState((){});
                    },
                  ),
                  items: featuredImages.map((featuredImage) {
                    return CustomBoxDecoration(background: featuredImage);
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      carouselController.previousPage();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselController.nextPage();
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedGradientStrokeButton(
                child: Text(
                  context.l10n!.select.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onPressed: () {
                  context
                      .read<ThemeProvider>()
                      .changeThemeBackgroundImage(featuredImages[currentIndex]);
                })
          ],
        ),
      ),
    );
  }
}
