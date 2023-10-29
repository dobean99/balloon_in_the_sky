class PngAssets {
  //get full path file name .png ==> example "assets/images/blue_ballon.png"
  static String get logo => 'logo'.png;
  static String get backgroundImage => 'background_image'.png;
  static String get backgroundImage2 => 'background_image_2'.png;
  static String get arrowLeftIcon => 'arrow_left_icon'.png;
  static String get arrowRightIcon => 'arrow_right_icon'.png;
  static String get homeIcon => 'home_icon'.png;
  static String get statisticsIcon => 'statistics_icon'.png;
  static String get whiteBalloonBG => 'white_balloon_bg'.png;
  static String get blueBalloonBG => 'blue_balloon_bg'.png;
  static String get redBalloonBG => 'red_balloon_bg'.png;

//get only file name .png ==> example "blue_ballon.png"
  static String get background => 'background_image'.src;
  static String get blueBalloon => 'blue_balloon'.src;
  static String get blueBurstBalloon => 'blue_burst_balloon'.src;
  static String get redBalloon => 'red_balloon'.src;
  static String get redBurstBalloon => 'red_burst_balloon'.src;
  static String get whiteBalloon => 'white_balloon'.src;
  static String get whiteBurstBalloon => 'white_burst_balloon'.src;

  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get src => '$this.png';
}
