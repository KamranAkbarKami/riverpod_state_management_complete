import 'package:flutter/material.dart';

class ScreenSizes {
  ScreenSizes._();
  static double getHeight({required BuildContext context}) {
    return MediaQuery.sizeOf(context).height * 1;
  }

  static double getWidth({required BuildContext context}) {
    return MediaQuery.sizeOf(context).width * 1;
  }
}
