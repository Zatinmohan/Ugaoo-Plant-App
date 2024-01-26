import 'package:flutter/material.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

class CustomInputFieldTheme {
  // ignore: unused_field
  final BuildContext _context;
  late InputDecorationTheme _themeData;

  CustomInputFieldTheme(BuildContext context) : _context = context {
    setThemeData();
  }

  void setThemeData() {
    _themeData = InputDecorationTheme(
      prefixIconColor: ColorConstants.kPrimaryIconColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
      fillColor: ColorConstants.kSecondaryAccentColor.withOpacity(0.4),
      filled: true,
      hintStyle: const TextStyle(
        color: ColorConstants.kPrimaryTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  InputDecorationTheme get themeData => _themeData;
}
