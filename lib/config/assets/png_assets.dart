class PngAssets {
  static String get logo => 'logo'.png;
  static String get backgroundImage => 'background_image'.png;

  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
}
