import 'package:flutter/material.dart';

class CustomTextTheme {
  final BuildContext _context;
  late TextTheme _textThemeData;
  CustomTextTheme( BuildContext context) : _context = context {
    setTextTheme();
  }

  void setTextTheme() {
    _textThemeData = TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: MediaQuery.sizeOf(_context).width * 0.2,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery.sizeOf(_context).width * 0.1,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: MediaQuery.sizeOf(_context).width * 0.06,
      ),
    );
  }

  TextTheme get textTheme => _textThemeData;
}
