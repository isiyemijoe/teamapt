import 'constants.dart';

class Helpers {
  static String getAsset(String file, {bool isSvg = false}) {
    String base = isSvg ? Constant.svgPath : Constant.imgPath;
    return base + file;
  }
}
