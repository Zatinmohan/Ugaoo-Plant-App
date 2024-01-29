import 'package:flutter/material.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

class CustomAppBarTheme {
  final BuildContext _context;
  late AppBarTheme _themeData;

  CustomAppBarTheme(this._context) {
    _setThemeData();
  }

  AppBarTheme get themeData => _themeData;

  void _setThemeData() {
    _themeData = AppBarTheme(
      color: ColorConstants.kPrimaryAppBarColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: ColorConstants.kPrimaryAccentColor,
        fontWeight: FontWeight.w700,
        fontSize: MediaQuery.sizeOf(_context).width * 0.07,
      ),
    );
  }
}
