import 'package:flutter/widgets.dart';

class DeviceDimension {
  static final DeviceDimension _instance = DeviceDimension._internal();

  factory DeviceDimension() => _instance;

  DeviceDimension._internal();

  bool _isInit = true;

  static late final MediaQueryData _mediaQueryData;
  static late final double screenWidth;
  static late final double screenHeight;
  static late final double blockSizeHorizontal;
  static late final double blockSizeVertical;

  void init(BuildContext context) {
    if (!_isInit) return;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _isInit = false;
  }
}