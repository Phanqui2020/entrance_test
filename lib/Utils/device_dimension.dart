import 'package:flutter/widgets.dart';

class DeviceDimension {
  static late final MediaQueryData _mediaQueryData;
  static late final double screenWidth;
  static late final double screenHeight;
  static late final double blockSizeHorizontal;
  static late final double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}