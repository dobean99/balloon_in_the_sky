class SvgAssets {
  static String get arrowLeftIcon => 'arrow_left_icon'.svg;

  static String get arrowRightIcon => 'arrow_right_icon'.svg;

  static String get homeIcon => 'home_icon'.svg;

  static String get statisticsIcon => 'statistics_icon'.svg;

  const SvgAssets._();
}

extension on String {
  String get svg => 'assets/svgs/$this.svg';
}
