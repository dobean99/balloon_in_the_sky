class PngAssets {
  static String get logo => 'logo'.png;
  static String get backgroundImage => 'background_image'.png;
  static String get blueBalloon => 'blue_balloon'.png;
  static String get blueBurstBalloon => 'blue_burst_balloon'.png;
  static String get redBalloon => 'red_balloon'.png;
  static String get redBurstBalloon => 'red_burst_balloon'.png;
  static String get whiteBalloon => 'white_balloon'.png;
  static String get whiteBurstBalloon => 'white_burst_balloon'.png;

  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
}
