import 'package:flutter/material.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

class CustomBottomNavBarTheme {
  final BuildContext _context;
  late final BottomNavigationBarThemeData _data;

  CustomBottomNavBarTheme({required BuildContext context})
      : _context = context {
    _setThemeData();
  }

  void _setThemeData() {
    _data = const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.kBackgroundColor,
      elevation: 2.0,
      showUnselectedLabels: true,
      unselectedItemColor: ColorConstants.kSecondaryAccentColor,
      selectedItemColor: ColorConstants.kPrimaryAccentColor,
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
      type: BottomNavigationBarType.fixed,
    );
  }

  BottomNavigationBarThemeData get themeData => _data;
}
