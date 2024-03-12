import 'package:flutter/material.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

class TextFieldStyles {
  static TextStyle getlabelTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: MediaQuery.sizeOf(context).width * 0.04,
    );
  }

  static OutlineInputBorder enabledTextFieldBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorConstants.kPrimaryAccentColor,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  static OutlineInputBorder selectedTextFieldBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorConstants.kPrimaryAccentColor,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  static TextStyle geterrorTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: MediaQuery.sizeOf(context).width * 0.03,
    );
  }
}
