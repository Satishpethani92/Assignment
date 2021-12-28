import 'package:assignment/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Utils {
  static H5Bold16(
          {fontSize = 16,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.toDouble());

  static regularTextStyle(
          {fontSize = 14,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.toDouble());

  static boldTextStyle(
          {fontSize = 14,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.toDouble());

  static void removeFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static final TextStyle appBarTextStyle = TextStyle(
      color: ColorConstants.black, fontSize: 18, fontWeight: FontWeight.w500);
  static final TextStyle headerTextStyle = TextStyle(
      color: ColorConstants.black, fontWeight: FontWeight.w600, fontSize: 22);
}
