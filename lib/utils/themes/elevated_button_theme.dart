import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  final BuildContext _context;
  late ElevatedButtonThemeData _themeData;

  CustomElevatedButtonTheme( BuildContext context)
      : _context = context {
    setThemeData();
  }

  void setThemeData() {
    _themeData = ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(2.0),
        minimumSize: MaterialStateProperty.all(
          Size(
            MediaQuery.sizeOf(_context).width * 0.5,
            MediaQuery.sizeOf(_context).width * 0.12,
          ),
        ),
        maximumSize: MaterialStateProperty.all(
          Size(
            MediaQuery.sizeOf(_context).width * 0.8,
            MediaQuery.sizeOf(_context).width * 0.15,
          ),
        ),
      ),
    );
  }

  ElevatedButtonThemeData get elevatedThemeDta => _themeData;
}
