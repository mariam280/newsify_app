import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold13(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF69BDFD),
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium13(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular15(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w400,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 1000) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
